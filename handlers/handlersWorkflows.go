package handlers

import (
	mdl "beerwh/models"
	route "beerwh/routes"
	sec "beerwh/security"
	"html/template"
	"log"
	"net/http"
	"strconv"
	"strings"
	"time"
)

func CreateWorkflowHandler(w http.ResponseWriter, r *http.Request) {
	sec.IsAuthenticated(w, r)
	log.Println("Create Workflow")
	if r.Method == "POST" {
		name := r.FormValue("Name")
		entityType := r.FormValue("EntityTypeForInsert")
		sqlStatement := "INSERT INTO workflows(name, entity_type, start_at) VALUES ($1,$2,$3) RETURNING id"
		wId := 0
		err := Db.QueryRow(sqlStatement, name, entityType, time.Now()).Scan(&wId)
		sec.CheckInternalServerError(err, w)
		if err != nil {
			panic(err.Error())
		}
		sec.CheckInternalServerError(err, w)
		log.Println("INSERT: Id: " + strconv.Itoa(wId) + " | Name: " + name + " | Entitity: " + entityType)
		for key, value := range r.Form {
			if strings.HasPrefix(key, "activity") {
				array := strings.Split(value[0], "#")
				log.Println(value[0])
				activityId := 0
				actionId := strings.Split(array[1], ":")[1]
				startAt, _ := time.Parse("yyyy-mm-dd", strings.Split(array[3], ":")[1])
				endAt, _ := time.Parse("yyyy-mm-dd", strings.Split(array[3], ":")[1])
				expDays := strings.Split(array[5], ":")[1]
				if expDays == "" {
					expDays = "0"
				}
				expActionId := strings.Split(array[6], ":")[1]
				strRoles := strings.Split(array[8], ":")[1]
				log.Println("actionId: " + actionId)
				sqlStatement := "INSERT INTO " +
					"activities(workflow_id, action_id, start_at, end_at, expiration_time_days, expiration_action_id) " +
					"VALUES ($1,$2,$3,$4,$5,$6) RETURNING id"
				log.Println(sqlStatement)
				log.Println("wId: " + strconv.Itoa(wId) + " | Action: " + actionId + " | ExpDays: " + expDays + " | ExpAction: " + expActionId)
				err := Db.QueryRow(sqlStatement, wId, actionId, startAt, endAt, expDays, expActionId).Scan(&activityId)
				sec.CheckInternalServerError(err, w)
				if err != nil {
					panic(err.Error())
				}
				if len(strRoles) > 0 {
					log.Println("Roles: " + strRoles)
					roles := strings.Split(strRoles, "&")
					for _, roleId := range roles {
						sqlStatement := "INSERT INTO " +
							"activities_roles(activity_id, role_id) " +
							"VALUES ($1,$2)"
						log.Println(sqlStatement + " - " + strconv.Itoa(activityId) + " - " + roleId)
						Db.QueryRow(sqlStatement, activityId, roleId)
					}
				}
				sec.CheckInternalServerError(err, w)
			}
		}
	}
	http.Redirect(w, r, route.WorkflowsRoute, 301)
}

func UpdateWorkflowHandler(w http.ResponseWriter, r *http.Request) {
	sec.IsAuthenticated(w, r)
	log.Println("Update Workflow")
	if r.Method == "POST" {
		id := r.FormValue("Id")
		name := r.FormValue("Name")
		sqlStatement := "UPDATE workflow SET name=$1 WHERE id=$2"
		updtForm, err := Db.Prepare(sqlStatement)
		sec.CheckInternalServerError(err, w)
		if err != nil {
			panic(err.Error())
		}
		sec.CheckInternalServerError(err, w)
		updtForm.Exec(name, id)
		log.Println("UPDATE: Id: " + id + " | Name: " + name)
	}
	http.Redirect(w, r, route.WorkflowsRoute, 301)
}

func DeleteWorkflowHandler(w http.ResponseWriter, r *http.Request) {
	sec.IsAuthenticated(w, r)
	log.Println("Delete Workflow")
	if r.Method == "POST" {
		id := r.FormValue("Id")
		sqlStatement := "DELETE FROM workflow WHERE id=$1"
		deleteForm, err := Db.Prepare(sqlStatement)
		if err != nil {
			panic(err.Error())
		}
		deleteForm.Exec(id)
		sec.CheckInternalServerError(err, w)
		log.Println("DELETE: Id: " + id)
	}
	http.Redirect(w, r, route.WorkflowsRoute, 301)
}

func ListWorkflowsHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("List Workflows")
	sec.IsAuthenticated(w, r)
	query := "SELECT id, name FROM workflows order by id asc"
	log.Println("List WF -> Query: " + query)
	rows, err := Db.Query(query)
	sec.CheckInternalServerError(err, w)
	var workflows []mdl.Workflow
	var workflow mdl.Workflow
	var i = 1
	for rows.Next() {
		err = rows.Scan(&workflow.Id, &workflow.Name)
		sec.CheckInternalServerError(err, w)
		workflow.Order = i
		i++
		workflows = append(workflows, workflow)
	}
	query = "SELECT a.id, a.name, a.origin_status_id, b.name as origin_status, " +
		"a.destination_status_id, c.name as destination_status, a.other_than " +
		"FROM actions a, status b, status c " +
		"WHERE a.origin_status_id = b.id " +
		"AND a.destination_status_id = c.id " +
		"order by a.id asc"
	log.Println("List WF -> Query: " + query)
	rows, err = Db.Query(query)
	sec.CheckInternalServerError(err, w)
	var actions []mdl.Action
	var action mdl.Action
	i = 1
	for rows.Next() {
		err = rows.Scan(&action.Id, &action.Name, &action.OriginId, &action.Origin, &action.DestinationId, &action.Destination, &action.OtherThan)
		sec.CheckInternalServerError(err, w)
		action.Order = i
		i++
		actions = append(actions, action)
	}
	query = "SELECT id, name FROM roles order by name asc"
	log.Println("List WF -> Query: " + query)
	rows, err = Db.Query(query)
	sec.CheckInternalServerError(err, w)
	var roles []mdl.Role
	var role mdl.Role
	i = 1
	for rows.Next() {
		err = rows.Scan(&role.Id, &role.Name)
		sec.CheckInternalServerError(err, w)
		role.Order = i
		i++
		roles = append(roles, role)
	}
	var page mdl.PageWorkflow
	page.Actions = actions
	page.Roles = roles
	page.Workflows = workflows
	page.Title = "Workflows"
	page.LoggedUser = BuildLoggedUser(GetUserInCookie(w, r))
	var tmpl = template.Must(template.ParseGlob("tiles/workflows/*"))
	tmpl.ParseGlob("tiles/*")
	tmpl.ExecuteTemplate(w, "Main-Workflows", page)
	sec.CheckInternalServerError(err, w)
}
