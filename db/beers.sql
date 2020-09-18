PGDMP     
    	    
            x            virtus    11.1    11.1 b    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    701348    virtus    DATABASE     �   CREATE DATABASE virtus WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE virtus;
             postgres    false            �            1259    701349    actions_id_seq    SEQUENCE     w   CREATE SEQUENCE public.actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.actions_id_seq;
       public       postgres    false            �            1259    701351    actions    TABLE     �   CREATE TABLE public.actions (
    id integer DEFAULT nextval('public.actions_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    origin_status_id integer,
    destination_status_id integer,
    other_than boolean
);
    DROP TABLE public.actions;
       public         postgres    false    196            �            1259    701355    actions_status_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.actions_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.actions_status_id_seq;
       public       postgres    false            �            1259    701357    actions_status    TABLE     �   CREATE TABLE public.actions_status (
    id integer DEFAULT nextval('public.actions_status_id_seq'::regclass) NOT NULL,
    action_id integer,
    origin_status_id integer,
    destination_status_id integer
);
 "   DROP TABLE public.actions_status;
       public         postgres    false    198            �            1259    701825    activities_id_seq    SEQUENCE     z   CREATE SEQUENCE public.activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.activities_id_seq;
       public       postgres    false            �            1259    702013 
   activities    TABLE     8  CREATE TABLE public.activities (
    id integer DEFAULT nextval('public.activities_id_seq'::regclass) NOT NULL,
    workflow_id integer,
    action_id integer,
    expiration_action_id integer,
    expiration_time_days integer,
    start_at timestamp without time zone,
    end_at timestamp without time zone
);
    DROP TABLE public.activities;
       public         postgres    false    217            �            1259    701361    activities_roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.activities_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.activities_roles_id_seq;
       public       postgres    false            �            1259    702038    activities_roles    TABLE     �   CREATE TABLE public.activities_roles (
    id integer DEFAULT nextval('public.activities_roles_id_seq'::regclass) NOT NULL,
    activity_id integer,
    role_id integer
);
 $   DROP TABLE public.activities_roles;
       public         postgres    false    200            �            1259    701367    beers_id_seq    SEQUENCE     u   CREATE SEQUENCE public.beers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.beers_id_seq;
       public       postgres    false            �            1259    701369    beers    TABLE     �   CREATE TABLE public.beers (
    id integer DEFAULT nextval('public.beers_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    qtd integer,
    price double precision
);
    DROP TABLE public.beers;
       public         postgres    false    201            �            1259    701373    features_id_seq    SEQUENCE     x   CREATE SEQUENCE public.features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.features_id_seq;
       public       postgres    false            �            1259    701375    features    TABLE     �   CREATE TABLE public.features (
    id integer DEFAULT nextval('public.features_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL
);
    DROP TABLE public.features;
       public         postgres    false    203            �            1259    701873    features_activities_id_seq    SEQUENCE     �   CREATE SEQUENCE public.features_activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.features_activities_id_seq;
       public       postgres    false            �            1259    702061    features_activities    TABLE     �   CREATE TABLE public.features_activities (
    id integer DEFAULT nextval('public.features_activities_id_seq'::regclass) NOT NULL,
    feature_id integer,
    activity_id integer
);
 '   DROP TABLE public.features_activities;
       public         postgres    false    218            �            1259    701382    features_roles_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.features_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.features_roles_id_seq;
       public       postgres    false            �            1259    702079    features_roles    TABLE     �   CREATE TABLE public.features_roles (
    id integer DEFAULT nextval('public.features_roles_id_seq'::regclass) NOT NULL,
    feature_id integer,
    role_id integer
);
 "   DROP TABLE public.features_roles;
       public         postgres    false    205            �            1259    701388    items_id_seq    SEQUENCE     u   CREATE SEQUENCE public.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.items_id_seq;
       public       postgres    false            �            1259    701390    items    TABLE     �   CREATE TABLE public.items (
    id integer DEFAULT nextval('public.items_id_seq'::regclass) NOT NULL,
    quantity double precision,
    beer_id integer,
    price double precision,
    item_value double precision,
    order_id integer
);
    DROP TABLE public.items;
       public         postgres    false    206            �            1259    701394    orders_id_seq    SEQUENCE     v   CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public       postgres    false            �            1259    701396    orders    TABLE     �   CREATE TABLE public.orders (
    id integer DEFAULT nextval('public.orders_id_seq'::regclass) NOT NULL,
    user_id integer,
    ordered_at timestamp without time zone,
    take_out_at timestamp without time zone,
    status_id integer
);
    DROP TABLE public.orders;
       public         postgres    false    208            �            1259    701400    roles_id_seq    SEQUENCE     u   CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public       postgres    false            �            1259    701402    roles    TABLE     �   CREATE TABLE public.roles (
    id integer DEFAULT nextval('public.roles_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.roles;
       public         postgres    false    210            �            1259    701406    status_id_seq    SEQUENCE     v   CREATE SEQUENCE public.status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.status_id_seq;
       public       postgres    false            �            1259    701408    status    TABLE     �   CREATE TABLE public.status (
    id integer DEFAULT nextval('public.status_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    stereotype character varying(255)
);
    DROP TABLE public.status;
       public         postgres    false    212            �            1259    701415    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       postgres    false            �            1259    702118    users    TABLE     Z  CREATE TABLE public.users (
    id integer DEFAULT nextval('public.users_id_seq'::regclass) NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    mobile character varying(255) NOT NULL,
    role_id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.users;
       public         postgres    false    214            �            1259    701424    workflows_id_seq    SEQUENCE     y   CREATE SEQUENCE public.workflows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.workflows_id_seq;
       public       postgres    false            �            1259    701426 	   workflows    TABLE       CREATE TABLE public.workflows (
    id integer DEFAULT nextval('public.workflows_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    entity_type character varying(30),
    start_at timestamp without time zone,
    end_at timestamp without time zone
);
    DROP TABLE public.workflows;
       public         postgres    false    215            �          0    701351    actions 
   TABLE DATA                     public       postgres    false    197   �q       �          0    701357    actions_status 
   TABLE DATA                     public       postgres    false    199   �r       �          0    702013 
   activities 
   TABLE DATA                     public       postgres    false    219   js       �          0    702038    activities_roles 
   TABLE DATA                     public       postgres    false    220   3t       �          0    701369    beers 
   TABLE DATA                     public       postgres    false    202   �t       �          0    701375    features 
   TABLE DATA                     public       postgres    false    204   7u       �          0    702061    features_activities 
   TABLE DATA                     public       postgres    false    221   �v       �          0    702079    features_roles 
   TABLE DATA                     public       postgres    false    222   �v       �          0    701390    items 
   TABLE DATA                     public       postgres    false    207   �w       �          0    701396    orders 
   TABLE DATA                     public       postgres    false    209   Hx       �          0    701402    roles 
   TABLE DATA                     public       postgres    false    211   �x       �          0    701408    status 
   TABLE DATA                     public       postgres    false    213   cy       �          0    702118    users 
   TABLE DATA                     public       postgres    false    223   z       �          0    701426 	   workflows 
   TABLE DATA                     public       postgres    false    216   I{       �           0    0    actions_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.actions_id_seq', 11, true);
            public       postgres    false    196            �           0    0    actions_status_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.actions_status_id_seq', 12, true);
            public       postgres    false    198            �           0    0    activities_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.activities_id_seq', 37, true);
            public       postgres    false    217            �           0    0    activities_roles_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.activities_roles_id_seq', 83, true);
            public       postgres    false    200            �           0    0    beers_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.beers_id_seq', 1, false);
            public       postgres    false    201            �           0    0    features_activities_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.features_activities_id_seq', 7, true);
            public       postgres    false    218            �           0    0    features_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.features_id_seq', 17, true);
            public       postgres    false    203            �           0    0    features_roles_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.features_roles_id_seq', 757, true);
            public       postgres    false    205            �           0    0    items_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.items_id_seq', 92, true);
            public       postgres    false    206            �           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 88, true);
            public       postgres    false    208            �           0    0    roles_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.roles_id_seq', 20, true);
            public       postgres    false    210            �           0    0    status_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.status_id_seq', 13, true);
            public       postgres    false    212            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 6, true);
            public       postgres    false    214            �           0    0    workflows_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.workflows_id_seq', 14, true);
            public       postgres    false    215            �
           2606    702055 '   activities_roles action_role_unique_key 
   CONSTRAINT     r   ALTER TABLE ONLY public.activities_roles
    ADD CONSTRAINT action_role_unique_key UNIQUE (activity_id, role_id);
 Q   ALTER TABLE ONLY public.activities_roles DROP CONSTRAINT action_role_unique_key;
       public         postgres    false    220    220            �
           2606    701433 '   actions_status action_status_unique_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.actions_status
    ADD CONSTRAINT action_status_unique_key UNIQUE (action_id, origin_status_id, destination_status_id);
 Q   ALTER TABLE ONLY public.actions_status DROP CONSTRAINT action_status_unique_key;
       public         postgres    false    199    199    199            �
           2606    701435    actions actions_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.actions
    ADD CONSTRAINT actions_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.actions DROP CONSTRAINT actions_pkey;
       public         postgres    false    197            �
           2606    701437 "   actions_status actions_status_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.actions_status
    ADD CONSTRAINT actions_status_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.actions_status DROP CONSTRAINT actions_status_pkey;
       public         postgres    false    199            �
           2606    702018    activities activities_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.activities DROP CONSTRAINT activities_pkey;
       public         postgres    false    219            �
           2606    702043 &   activities_roles activities_roles_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.activities_roles
    ADD CONSTRAINT activities_roles_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.activities_roles DROP CONSTRAINT activities_roles_pkey;
       public         postgres    false    220            �
           2606    701439    beers beers_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.beers
    ADD CONSTRAINT beers_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.beers DROP CONSTRAINT beers_pkey;
       public         postgres    false    202            �
           2606    702115 &   features_roles feature_role_unique_key 
   CONSTRAINT     p   ALTER TABLE ONLY public.features_roles
    ADD CONSTRAINT feature_role_unique_key UNIQUE (feature_id, role_id);
 P   ALTER TABLE ONLY public.features_roles DROP CONSTRAINT feature_role_unique_key;
       public         postgres    false    222    222            �
           2606    702066 ,   features_activities features_activities_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.features_activities
    ADD CONSTRAINT features_activities_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.features_activities DROP CONSTRAINT features_activities_pkey;
       public         postgres    false    221            �
           2606    702078 2   features_activities features_activities_unique_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.features_activities
    ADD CONSTRAINT features_activities_unique_key UNIQUE (activity_id, feature_id);
 \   ALTER TABLE ONLY public.features_activities DROP CONSTRAINT features_activities_unique_key;
       public         postgres    false    221    221            �
           2606    701443    features features_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.features DROP CONSTRAINT features_pkey;
       public         postgres    false    204            �
           2606    702093 "   features_roles features_roles_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.features_roles
    ADD CONSTRAINT features_roles_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.features_roles DROP CONSTRAINT features_roles_pkey;
       public         postgres    false    222            �
           2606    701445    items items_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.items DROP CONSTRAINT items_pkey;
       public         postgres    false    207            �
           2606    701447    orders order_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.orders DROP CONSTRAINT order_pkey;
       public         postgres    false    209            �
           2606    701449    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public         postgres    false    211            �
           2606    701451    status status_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public         postgres    false    213            �
           2606    702138    users username_unique_key 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT username_unique_key UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT username_unique_key;
       public         postgres    false    223                       2606    702126    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    223            �
           2606    701457    workflows workflows_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.workflows
    ADD CONSTRAINT workflows_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.workflows DROP CONSTRAINT workflows_pkey;
       public         postgres    false    216                       2606    702019    activities action_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.activities
    ADD CONSTRAINT action_fkey FOREIGN KEY (action_id) REFERENCES public.actions(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 @   ALTER TABLE ONLY public.activities DROP CONSTRAINT action_fkey;
       public       postgres    false    2781    197    219                       2606    701458    actions_status actions_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.actions_status
    ADD CONSTRAINT actions_fkey FOREIGN KEY (action_id) REFERENCES public.actions(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 E   ALTER TABLE ONLY public.actions_status DROP CONSTRAINT actions_fkey;
       public       postgres    false    2781    197    199                       2606    702044     activities_roles activities_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.activities_roles
    ADD CONSTRAINT activities_fkey FOREIGN KEY (activity_id) REFERENCES public.activities(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 J   ALTER TABLE ONLY public.activities_roles DROP CONSTRAINT activities_fkey;
       public       postgres    false    220    219    2801                       2606    702067 #   features_activities activities_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.features_activities
    ADD CONSTRAINT activities_fkey FOREIGN KEY (activity_id) REFERENCES public.activities(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 M   ALTER TABLE ONLY public.features_activities DROP CONSTRAINT activities_fkey;
       public       postgres    false    2801    221    219                       2606    701468    items beers_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.items
    ADD CONSTRAINT beers_fkey FOREIGN KEY (beer_id) REFERENCES public.beers(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 :   ALTER TABLE ONLY public.items DROP CONSTRAINT beers_fkey;
       public       postgres    false    207    2787    202                       2606    701473    actions destination_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.actions
    ADD CONSTRAINT destination_status_fkey FOREIGN KEY (destination_status_id) REFERENCES public.status(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 I   ALTER TABLE ONLY public.actions DROP CONSTRAINT destination_status_fkey;
       public       postgres    false    213    197    2797                       2606    701478 &   actions_status destination_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.actions_status
    ADD CONSTRAINT destination_status_fkey FOREIGN KEY (destination_status_id) REFERENCES public.status(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 P   ALTER TABLE ONLY public.actions_status DROP CONSTRAINT destination_status_fkey;
       public       postgres    false    213    2797    199                       2606    702024 !   activities expiration_action_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.activities
    ADD CONSTRAINT expiration_action_fkey FOREIGN KEY (expiration_action_id) REFERENCES public.actions(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 K   ALTER TABLE ONLY public.activities DROP CONSTRAINT expiration_action_fkey;
       public       postgres    false    2781    197    219                       2606    702072 !   features_activities features_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.features_activities
    ADD CONSTRAINT features_fkey FOREIGN KEY (feature_id) REFERENCES public.features(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 K   ALTER TABLE ONLY public.features_activities DROP CONSTRAINT features_fkey;
       public       postgres    false    221    204    2789                       2606    702099    features_roles features_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.features_roles
    ADD CONSTRAINT features_fkey FOREIGN KEY (feature_id) REFERENCES public.features(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 F   ALTER TABLE ONLY public.features_roles DROP CONSTRAINT features_fkey;
       public       postgres    false    2789    222    204                       2606    701488    items orders_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.items
    ADD CONSTRAINT orders_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 ;   ALTER TABLE ONLY public.items DROP CONSTRAINT orders_fkey;
       public       postgres    false    209    2793    207                       2606    701493    actions origin_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.actions
    ADD CONSTRAINT origin_status_fkey FOREIGN KEY (origin_status_id) REFERENCES public.status(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 D   ALTER TABLE ONLY public.actions DROP CONSTRAINT origin_status_fkey;
       public       postgres    false    2797    197    213                       2606    701498 !   actions_status origin_status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.actions_status
    ADD CONSTRAINT origin_status_fkey FOREIGN KEY (origin_status_id) REFERENCES public.status(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 K   ALTER TABLE ONLY public.actions_status DROP CONSTRAINT origin_status_fkey;
       public       postgres    false    213    199    2797                       2606    702049    activities_roles roles_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.activities_roles
    ADD CONSTRAINT roles_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 E   ALTER TABLE ONLY public.activities_roles DROP CONSTRAINT roles_fkey;
       public       postgres    false    2795    211    220                       2606    702104    features_roles roles_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.features_roles
    ADD CONSTRAINT roles_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 C   ALTER TABLE ONLY public.features_roles DROP CONSTRAINT roles_fkey;
       public       postgres    false    2795    211    222                       2606    702132    users roles_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT roles_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT roles_fkey;
       public       postgres    false    2795    211    223            	           2606    701852    orders status_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT status_fkey FOREIGN KEY (status_id) REFERENCES public.status(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT status_fkey;
       public       postgres    false    209    2797    213            
           2606    702127    orders users_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT users_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 ;   ALTER TABLE ONLY public.orders DROP CONSTRAINT users_fkey;
       public       postgres    false    209    223    2817                       2606    702029    activities workflow_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.activities
    ADD CONSTRAINT workflow_fkey FOREIGN KEY (workflow_id) REFERENCES public.workflows(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 B   ALTER TABLE ONLY public.activities DROP CONSTRAINT workflow_fkey;
       public       postgres    false    2799    216    219            �   �   x����
�0�}�bvZb_��P�*��eڎv &�D~�IA���raw���N��<���j��c�,����N����:tO[��&�Xah���5d
נ��ܞ�#��z�r�nhzf��(-ŋ(���d��4���k���:eL�b��"�� �NcX�}h�%K~��0¬�w$�A/-_�v�/ �>*�ڞ      �   �   x���v
Q���W((M��L�KL.���+�/.I,)-V��L�Q��Ń��E��yPY�HJjqIf^"X\XS!��'�5XA�XG�\G�BG�RӚ˓����(��44���@��A,4��� ����W:�h���@m�� ��      �   �   x���K�@�bn*L��/�S�AR����LE��o����!����xA�"����=-y�f��.xс�s��n����qú�c�lx����*��Hr��:�Z�01�U>t�;?vC���6B�>AP	!t%��Rg��V��n0'%KFX�Y���֒����3�1(���X&�      �   �   x���v
Q���W((M��L�KL.�,�,�L-�/��I-V��L�Q��Vƃ8 q CS!��'�5XA��XG���4��<�c���L��T4�j$5�i4ӌ�δ�id@=3-�f�Rՙ�#��L#����u�1�HP�sq K��y      �   U   x���v
Q���W((M��L�KJM-*V��L�Q�K�M�Q(,2�2�S5�}B]�4u�}�s����u���5 ��      �   ?  x���KN�0��}N�][)B�WA�B�J��5�M<�n�	��@��b8M�	��2V��+���v���nÊ�E��l��X6�"d9?@�2-`�U�H�x��Jڒ6��܎ܑrG Ǝ&�AL�/�27݆͌�40ٽ��gm��J�b<��W��da�?��ט�B
��7F��_ݺ�|����S[՟Fbrj�����͍L��zw̋�G��V@��%)ݯ��=�a\tۋ*�VeY��9WRp�}�!��0�G�[t3�#zk���/�GY�&���i��G��t�W��n>C:;�l\���S����      �   S   x���v
Q���W((M��L�KKM,)-J-�OL.�,�,�L-V��L�Q�Jă�P�J GS!��'�5XA�\G���M4���� ���      �   �   x����
�0�w��F�P�O���A(��*�MAZ����G������#ɗ�i�kGu�]�>�q8����~����
Ǘ�}��Y�e��~:ߪ�Bvl�ꊎA� ��L`��P:C���mJ�<�K�<�ː�t�o10�����H�ȕH���H��!a�C&�j�l��	��V;d&oߠ��A����      �   z   x���v
Q���W((M��L��,I�-V��L�Q(,M�+�,��QHJM-�	e&��(�ŗ%���E)`IM�0G�P�`K#cC 20 2A����5�'m�Zd���l�9�:.. �>Bo      �   �   x���v
Q���W((M��L��/JI-*V��L�Q(-N-�1���)�%:
%�٩���%`NqIbIi1P��B��O�k������������������������������:�������5�'-\c��+Ct�X"��5�X��{�X"��� xku�      �   `   x���v
Q���W((M��L�+��I-V��L�Q�K�M�Ts�	uV�02�QPK�KIM�/R״��$A��P�sNfj^I*�z�ZSr3�@�� #�4�      �   �   x��̱
�0 н_q[Z(�8�8��*��_�C5	�u��M�/�noz���U�GpC�w�,0� �t�C`�d��(�kq��
�U�hȳQ�g�m�뷎��[�zi���|һ���H��'}�yLvhZ�Qۿ�˘쩽�1K��r~      �   .  x����n�@��<�,HЄ�(�n��-�� Җn�G��ˈ�e���u&m�'h�b�s���u��7:6I��0Z3ԃ��D[����Hk���hA WQQ%�����
_=���	QOW�Bj 
?��uC�tۍmV8C�6˨����LkV�AlF�q;�;����	���N�ygq�r�p�Ҫé���㉡O�y�nDށ�(�+��'����[e�K7�-�>'�r�6ڕ���s6�<�;�cF��O,1��4`��1��k��ߑ4�*=ԋ�H���xa�6�zy��6d~�r:I�D�      �   �   x���v
Q���W((M��L�+�/�N��//V��L�Q�K�M�QH�+�,��/�, r�K�J�K@�)@ZS!��'�5XA��DGA=���PH����FF�����
�fV&fVF�z��Ɔ e~�>>��\\\ e'C     