package handlers

import (
	mdl "beerwh/models"
	route "beerwh/routes"
	sec "beerwh/security"
	"database/sql"
	"encoding/json"
	"html/template"
	"log"
	"net/http"
	"strconv"
	"strings"
)

func CreateOrderHandler(w http.ResponseWriter, r *http.Request) {
	sec.IsAuthenticated(w, r)
	log.Println("Create Order")
	statusId := GetStartStatus("order")
	snippet1 := ""
	snippet2 := ""
	if statusId != 0 {
		snippet1 = ", status_id"
		snippet2 = ", $4"
	}
	if r.Method == "POST" {
		userId := r.FormValue("UserForInsert")
		orderedDate := r.FormValue("OrderDateForInsert")
		orderedAt := r.FormValue("OrderedAtForInsert")
		takeOutDate := r.FormValue("TakeOutDateForInsert")
		takeOutAt := r.FormValue("TakeOutAtForInsert")
		orderedAt = orderedDate + " " + orderedAt
		takeOutAt = takeOutDate + " " + takeOutAt
		log.Println("orderedAt: " + orderedAt)
		log.Println("takeOutAt: " + takeOutAt)
		sqlStatement := "INSERT INTO public.orders ( " +
			" user_id, ordered_at, take_out_at " + snippet1 + " ) " +
			" VALUES ($1, TO_TIMESTAMP($2, 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP($3, 'YYYY-MM-DD HH24:MI:SS')" + snippet2 + ") RETURNING id"
		orderId := 0
		log.Println(statusId)
		if statusId != 0 {
			err := Db.QueryRow(sqlStatement, userId, orderedAt, takeOutAt, statusId).Scan(&orderId)
			sec.CheckInternalServerError(err, w)
			if err != nil {
				panic(err.Error())
			}
		} else {
			err := Db.QueryRow(sqlStatement, userId, orderedAt, takeOutAt).Scan(&orderId)
			sec.CheckInternalServerError(err, w)
			if err != nil {
				panic(err.Error())
			}
		}
		for key, value := range r.Form {
			if strings.HasPrefix(key, "item") {
				log.Println("value[0]: " + value[0])
				array := strings.Split(value[0], "#")
				beerId := strings.Split(array[4], ":")[1]
				qtd := extraiValor(strings.Split(array[6], ":"))
				price := extraiValor(strings.Split(array[7], ":"))
				itemValue := extraiValor(strings.Split(array[8], ":"))
				itemId := 0
				log.Println("beerId: " + beerId)
				sqlStatement := "INSERT INTO items(order_id, beer_id, quantity, price, item_value) VALUES ($1,$2,$3,$4,$5) RETURNING id"
				err := Db.QueryRow(sqlStatement, orderId, beerId, qtd, price, itemValue).Scan(&itemId)
				sec.CheckInternalServerError(err, w)
				if err != nil {
					panic(err.Error())
				}
				sec.CheckInternalServerError(err, w)
				l := "INSERT: Id: " + strconv.Itoa(orderId)
				l += " | UserId: " + userId
				l += " | OrderedDate: " + orderedDate
				l += " | OrderedAt: " + orderedAt
				l += " | TakeOutDate: " + takeOutDate
				l += " | TakeOutAt: " + takeOutAt
				log.Println(l)
			}
		}
	}
	http.Redirect(w, r, route.OrdersRoute, 301)
}

func extraiValor(arr []string) string {
	r := "0.0"
	if len(arr) > 1 && arr[1] != "" {
		r = arr[1]
	}
	return r
}

func DeleteOrderHandler(w http.ResponseWriter, r *http.Request) {
	sec.IsAuthenticated(w, r)
	log.Println("Delete Order")
	if r.Method == "POST" {
		id := r.FormValue("Id")
		sqlStatement := "DELETE FROM Items WHERE order_id=$1"
		deleteForm, err := Db.Prepare(sqlStatement)
		if err != nil {
			panic(err.Error())
		}
		deleteForm.Exec(id)
		sqlStatement = "DELETE FROM Orders WHERE id=$1"
		deleteForm, err = Db.Prepare(sqlStatement)
		if err != nil {
			panic(err.Error())
		}
		deleteForm.Exec(id)
		sec.CheckInternalServerError(err, w)
		log.Println("DELETE: Id: " + id)
	}
	http.Redirect(w, r, route.OrdersRoute, 301)
}

func UpdateOrderHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("Update Order")
	if r.Method == "POST" {
		sec.IsAuthenticated(w, r)
		orderId := r.FormValue("Id")
		log.Println("OrderId: " + orderId)
		userId := r.FormValue("UserForUpdate")
		orderedDate := r.FormValue("OrderDateForUpdate")
		orderedAt := r.FormValue("OrderedAtForUpdate")
		orderedDT := orderedDate + " " + orderedAt
		takeoutDate := r.FormValue("TakeOutDateForUpdate")
		takeoutAt := r.FormValue("TakeOutAtForUpdate")
		takeoutDT := takeoutDate + " " + takeoutAt
		sqlStatement := "UPDATE orders SET " +
			" user_id = $1, " +
			" ordered_at = TO_TIMESTAMP($2, 'YYYY-MM-DD HH24:MI:SS'), " +
			" take_out_at = TO_TIMESTAMP($3, 'YYYY-MM-DD HH24:MI:SS') " +
			" WHERE id = $4"
		log.Println(sqlStatement)
		updtForm, err := Db.Prepare(sqlStatement)
		sec.CheckInternalServerError(err, w)
		if err != nil {
			panic(err.Error())
		}
		sec.CheckInternalServerError(err, w)
		updtForm.Exec(userId, orderedDT, takeoutDT, orderId)
		log.Println("UPDATE: Id: " + orderId +
			" | User Id: " + userId +
			" | Ordered At: " + orderedDT +
			" | Take Out At: " + takeoutDT)

		var itemsDB = ListItemsHandler(orderId)
		var itemsPage []mdl.Item
		var itemPage mdl.Item
		for key, value := range r.Form {
			if strings.HasPrefix(key, "item") {
				log.Println("update - value[0]: " + value[0])
				array := strings.Split(value[0], "#")
				itemid := strings.Split(array[1], ":")[1]
				itemPage.Beer = strings.Split(array[4], ":")[1]
				qtd := strings.Split(array[6], ":")[1]
				price := strings.Split(array[7], ":")[1]
				itemValue := strings.Split(array[8], ":")[1]
				n, _ := strconv.ParseInt(itemid, 10, 64)
				itemPage.Id = n
				q, _ := strconv.ParseFloat(qtd, 64)
				itemPage.Qtt = q
				r, _ := strconv.ParseFloat(price, 64)
				itemPage.Price = r
				s, _ := strconv.ParseFloat(itemValue, 64)
				itemPage.ItemValue = s
				itemsPage = append(itemsPage, itemPage)
			}
		}
		if len(itemsPage) < len(itemsDB) {
			log.Println("Quantidade de Itens da Página: " + strconv.Itoa(len(itemsPage)))
			if len(itemsPage) == 0 {
				DeleteItemsByOrderHandler(orderId) //DONE
			} else {
				var diffDB []mdl.Item = itemsDB
				for n := range itemsPage {
					if containsItem(diffDB, itemsPage[n]) {
						diffDB = removeItem(diffDB, itemsPage[n])
					}
				}
				DeleteItemsHandler(diffDB) //DONE
			}
		} else {
			var diffPage []mdl.Item = itemsPage
			for n := range itemsDB {
				if containsItem(diffPage, itemsDB[n]) {
					diffPage = removeItem(diffPage, itemsDB[n])
				}
			}
			itemId := 0
			var item mdl.Item
			for i := range diffPage {
				item = diffPage[i]
				log.Println("Order Id: " + strconv.FormatInt(item.IdOrder, 10))
				sqlStatement := "INSERT INTO items(order_id, beer_id, quantity, price, item_value) VALUES ($1,$2,$3,$4,$5) RETURNING id"
				log.Println(sqlStatement)
				log.Println("beerid: " + item.Beer)
				err := Db.QueryRow(sqlStatement, orderId, item.Beer, item.Qtt, item.Price, item.ItemValue).Scan(&itemId)
				sec.CheckInternalServerError(err, w)
				if err != nil {
					panic(err.Error())
				}
				sec.CheckInternalServerError(err, w)
			}
		}
		UpdateItemsHandler(itemsPage, itemsDB) // TODO
		http.Redirect(w, r, route.OrdersRoute, 301)
	}
}

func containsItem(items []mdl.Item, itemCompared mdl.Item) bool {
	for n := range items {
		if items[n].Id == itemCompared.Id {
			return true
		}
	}
	return false
}

func removeItem(items []mdl.Item, itemToBeRemoved mdl.Item) []mdl.Item {
	var newItems []mdl.Item
	for i := range items {
		if items[i].Id != itemToBeRemoved.Id {
			newItems = append(newItems, items[i])
		}
	}
	return newItems
}

func LoadItemsByOrderId(w http.ResponseWriter, r *http.Request) {
	log.Println("Load Items By Order Id")
	r.ParseForm()
	var idOrder = r.FormValue("idOrder")
	log.Println("idOrder: " + idOrder)
	items := ListItemsHandler(idOrder)
	jsonItems, _ := json.Marshal(items)
	w.Write([]byte(jsonItems))
	log.Println("JSON")
}

func ListOrdersHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("List Orders")
	sec.IsAuthenticated(w, r)
	query := "SELECT a.id, a.user_id, b.name, a.ordered_at, a.take_out_at, " +
		" coalesce(to_char(a.ordered_at,'DD/MM/YYYY'),'') as c_ordered_date," +
		" coalesce(to_char(a.take_out_at,'DD/MM/YYYY'),'') as c_takeout_date," +
		" coalesce(to_char(a.ordered_at,'DD/MM/YYYY HH24:MI:SS'),'') as c_ordered_date_time," +
		" coalesce(to_char(a.take_out_at,'DD/MM/YYYY HH24:MI:SS'),'') as c_takeout_date_time," +
		" c.id as status_id, coalesce(c.name,'') as status FROM orders a LEFT JOIN users b ON a.user_id = b.id" +
		" LEFT OUTER JOIN status c ON a.status_id = c.id " +
		" order by a.take_out_at desc "
	rows, err := Db.Query(query)
	log.Println("Query: " + query)
	sec.CheckInternalServerError(err, w)
	var orders []mdl.Order
	var order mdl.Order
	var i = 1
	var status sql.NullInt64
	for rows.Next() {
		err = rows.Scan(
			&order.Id,
			&order.UserId,
			&order.UserName,
			&order.OrderedAt,
			&order.TakeOutAt,
			&order.COrderedAt,
			&order.CTakeOutAt,
			&order.COrderedDateTime,
			&order.CTakeOutDateTime,
			&status,
			&order.CStatus,
		)
		sec.CheckInternalServerError(err, w)
		if status.Valid {
			order.StatusId = status.Int64
		}
		order.Order = i
		i++
		orders = append(orders, order)
	}
	rows, err = Db.Query("SELECT id, name FROM users order by name")
	sec.CheckInternalServerError(err, w)
	var users []mdl.User
	var user mdl.User

	savedUser := GetUserInCookie(w, r)
	log.Println("ORDERS Saved User is " + savedUser.Username)

	for rows.Next() {
		err = rows.Scan(&user.Id, &user.Name)
		if user.Id == savedUser.Id {
			user.Selected = true
		} else {
			user.Selected = false
		}
		sec.CheckInternalServerError(err, w)
		users = append(users, user)
	}
	var page mdl.PageOrders
	page.Users = users
	rows, err = Db.Query("SELECT id, name, qtd, price FROM beers order by name")
	sec.CheckInternalServerError(err, w)
	var beers []mdl.Beer
	var beer mdl.Beer
	for rows.Next() {
		err = rows.Scan(&beer.Id, &beer.Name, &beer.Qtd, &beer.Price)
		sec.CheckInternalServerError(err, w)
		beers = append(beers, beer)
	}
	page.Beers = beers
	page.Orders = orders
	page.AppName = mdl.AppName
	page.Title = "Pedidos"
	page.LoggedUser = BuildLoggedUser(savedUser)
	var tmpl = template.Must(template.ParseGlob("tiles/orders/*"))
	tmpl.ParseGlob("tiles/*")
	tmpl.ExecuteTemplate(w, "Main-Orders", page)
	sec.CheckInternalServerError(err, w)
}
