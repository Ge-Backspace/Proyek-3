PGDMP         
                y            absensi    10.14    12.4 ?    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16473    absensi    DATABASE     ?   CREATE DATABASE absensi WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE absensi;
                postgres    false            ?            1259    40405    checkins    TABLE     ?  CREATE TABLE public.checkins (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    checkin_time timestamp(0) without time zone,
    checkout_time timestamp(0) without time zone,
    lat character varying(255) NOT NULL,
    lng character varying(255) NOT NULL,
    address character varying(255),
    status integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.checkins;
       public            postgres    false            ?            1259    40403    checkins_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.checkins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.checkins_id_seq;
       public          postgres    false    213            ?           0    0    checkins_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.checkins_id_seq OWNED BY public.checkins.id;
          public          postgres    false    212            ?            1259    40304 	   companies    TABLE     2  CREATE TABLE public.companies (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    file_id integer,
    remember_token character varying(100),
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.companies;
       public            postgres    false            ?            1259    40302    companies_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.companies_id_seq;
       public          postgres    false    203            ?           0    0    companies_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;
          public          postgres    false    202            ?            1259    40476    cuti_permissions    TABLE     ?  CREATE TABLE public.cuti_permissions (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    cuti_id integer NOT NULL,
    status_id integer DEFAULT 0 NOT NULL,
    start_date date NOT NULL,
    expired_date date NOT NULL,
    reason character varying(255) NOT NULL,
    file_id integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 $   DROP TABLE public.cuti_permissions;
       public            postgres    false            ?            1259    40474    cuti_permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.cuti_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.cuti_permissions_id_seq;
       public          postgres    false    221            ?           0    0    cuti_permissions_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.cuti_permissions_id_seq OWNED BY public.cuti_permissions.id;
          public          postgres    false    220            ?            1259    40460    cutis    TABLE       CREATE TABLE public.cutis (
    id integer NOT NULL,
    company_id integer NOT NULL,
    cuti_name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.cutis;
       public            postgres    false            ?            1259    40458    cutis_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.cutis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.cutis_id_seq;
       public          postgres    false    219            ?           0    0    cutis_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.cutis_id_seq OWNED BY public.cutis.id;
          public          postgres    false    218            ?            1259    40547    early_checkouts    TABLE       CREATE TABLE public.early_checkouts (
    id integer NOT NULL,
    checkin_id integer NOT NULL,
    reason character varying(255) NOT NULL,
    file_id integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 #   DROP TABLE public.early_checkouts;
       public            postgres    false            ?            1259    40545    early_checkouts_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.early_checkouts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.early_checkouts_id_seq;
       public          postgres    false    227            ?           0    0    early_checkouts_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.early_checkouts_id_seq OWNED BY public.early_checkouts.id;
          public          postgres    false    226            ?            1259    40383 	   employees    TABLE     ?  CREATE TABLE public.employees (
    id integer NOT NULL,
    user_id integer NOT NULL,
    name character varying(255) NOT NULL,
    nip character varying(255),
    position_id integer,
    status boolean DEFAULT false NOT NULL,
    kontak character varying(255),
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.employees;
       public            postgres    false            ?            1259    40381    employees_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.employees_id_seq;
       public          postgres    false    211            ?           0    0    employees_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;
          public          postgres    false    210            ?            1259    40280    files    TABLE     G  CREATE TABLE public.files (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    file_name character varying(255) NOT NULL,
    extension character varying(255) NOT NULL,
    size character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.files;
       public            postgres    false            ?            1259    40278    files_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.files_id_seq;
       public          postgres    false    199            ?           0    0    files_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;
          public          postgres    false    198            ?            1259    40534    gajis    TABLE     ?   CREATE TABLE public.gajis (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    gaji integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.gajis;
       public            postgres    false            ?            1259    40532    gajis_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.gajis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.gajis_id_seq;
       public          postgres    false    225            ?           0    0    gajis_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.gajis_id_seq OWNED BY public.gajis.id;
          public          postgres    false    224            ?            1259    40578    lembur_permissions    TABLE     ?  CREATE TABLE public.lembur_permissions (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    schedule_in time(0) without time zone NOT NULL,
    schedule_out time(0) without time zone NOT NULL,
    date date NOT NULL,
    status_id integer DEFAULT 0 NOT NULL,
    reason character varying(255) NOT NULL,
    file_id integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 &   DROP TABLE public.lembur_permissions;
       public            postgres    false            ?            1259    40576    lembur_permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.lembur_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.lembur_permissions_id_seq;
       public          postgres    false    231            ?           0    0    lembur_permissions_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.lembur_permissions_id_seq OWNED BY public.lembur_permissions.id;
          public          postgres    false    230            ?            1259    40272 
   migrations    TABLE     ?   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public            postgres    false            ?            1259    40270    migrations_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    197            ?           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    196            ?            1259    40291    multi_files    TABLE       CREATE TABLE public.multi_files (
    id integer NOT NULL,
    id_file integer NOT NULL,
    id_parent integer NOT NULL,
    type character varying(4) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.multi_files;
       public            postgres    false            ?            1259    40289    multi_files_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.multi_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.multi_files_id_seq;
       public          postgres    false    201            ?           0    0    multi_files_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.multi_files_id_seq OWNED BY public.multi_files.id;
          public          postgres    false    200            ?            1259    40346    offices    TABLE     }  CREATE TABLE public.offices (
    id integer NOT NULL,
    company_id integer NOT NULL,
    office_name character varying(255) NOT NULL,
    lat character varying(255) NOT NULL,
    lng character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    file_id integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.offices;
       public            postgres    false            ?            1259    40344    offices_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.offices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.offices_id_seq;
       public          postgres    false    207            ?           0    0    offices_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.offices_id_seq OWNED BY public.offices.id;
          public          postgres    false    206            ?            1259    40367 	   positions    TABLE       CREATE TABLE public.positions (
    id integer NOT NULL,
    company_id integer NOT NULL,
    position_name character varying(255) NOT NULL,
    "group" character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.positions;
       public            postgres    false            ?            1259    40365    positions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.positions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.positions_id_seq;
       public          postgres    false    209            ?           0    0    positions_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.positions_id_seq OWNED BY public.positions.id;
          public          postgres    false    208            ?            1259    40437    shift_employees    TABLE       CREATE TABLE public.shift_employees (
    id integer NOT NULL,
    company_id integer NOT NULL,
    employee_id integer NOT NULL,
    shift_id integer NOT NULL,
    date date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 #   DROP TABLE public.shift_employees;
       public            postgres    false            ?            1259    40435    shift_employees_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.shift_employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.shift_employees_id_seq;
       public          postgres    false    217            ?           0    0    shift_employees_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.shift_employees_id_seq OWNED BY public.shift_employees.id;
          public          postgres    false    216            ?            1259    40500    shift_permissions    TABLE     ?  CREATE TABLE public.shift_permissions (
    id integer NOT NULL,
    employee1_id integer NOT NULL,
    employee2_id integer NOT NULL,
    shift_employee1_id integer NOT NULL,
    shift_employee2_id integer NOT NULL,
    status_id integer DEFAULT 0 NOT NULL,
    reason character varying(255) NOT NULL,
    file_id integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 %   DROP TABLE public.shift_permissions;
       public            postgres    false            ?            1259    40498    shift_permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.shift_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.shift_permissions_id_seq;
       public          postgres    false    223            ?           0    0    shift_permissions_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.shift_permissions_id_seq OWNED BY public.shift_permissions.id;
          public          postgres    false    222            ?            1259    40421    shifts    TABLE     z  CREATE TABLE public.shifts (
    id integer NOT NULL,
    company_id integer NOT NULL,
    shift_name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    schedule_in time(0) without time zone NOT NULL,
    schedule_out time(0) without time zone NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.shifts;
       public            postgres    false            ?            1259    40419    shifts_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.shifts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.shifts_id_seq;
       public          postgres    false    215            ?           0    0    shifts_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.shifts_id_seq OWNED BY public.shifts.id;
          public          postgres    false    214            ?            1259    40565    tests    TABLE     ?   CREATE TABLE public.tests (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    file_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.tests;
       public            postgres    false            ?            1259    40563    tests_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.tests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.tests_id_seq;
       public          postgres    false    229            ?           0    0    tests_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.tests_id_seq OWNED BY public.tests.id;
          public          postgres    false    228            ?            1259    40319    users    TABLE     6  CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    company_id integer NOT NULL,
    file_id integer,
    admin boolean DEFAULT false NOT NULL,
    aktif boolean DEFAULT false NOT NULL,
    remember_token character varying(100),
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.users;
       public            postgres    false            ?            1259    40317    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    205            ?           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    204            ?
           2604    40408    checkins id    DEFAULT     j   ALTER TABLE ONLY public.checkins ALTER COLUMN id SET DEFAULT nextval('public.checkins_id_seq'::regclass);
 :   ALTER TABLE public.checkins ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            ?
           2604    40307    companies id    DEFAULT     l   ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);
 ;   ALTER TABLE public.companies ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            ?
           2604    40479    cuti_permissions id    DEFAULT     z   ALTER TABLE ONLY public.cuti_permissions ALTER COLUMN id SET DEFAULT nextval('public.cuti_permissions_id_seq'::regclass);
 B   ALTER TABLE public.cuti_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            ?
           2604    40463    cutis id    DEFAULT     d   ALTER TABLE ONLY public.cutis ALTER COLUMN id SET DEFAULT nextval('public.cutis_id_seq'::regclass);
 7   ALTER TABLE public.cutis ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            ?
           2604    40550    early_checkouts id    DEFAULT     x   ALTER TABLE ONLY public.early_checkouts ALTER COLUMN id SET DEFAULT nextval('public.early_checkouts_id_seq'::regclass);
 A   ALTER TABLE public.early_checkouts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            ?
           2604    40386    employees id    DEFAULT     l   ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);
 ;   ALTER TABLE public.employees ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            ?
           2604    40283    files id    DEFAULT     d   ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);
 7   ALTER TABLE public.files ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    198    199    199            ?
           2604    40537    gajis id    DEFAULT     d   ALTER TABLE ONLY public.gajis ALTER COLUMN id SET DEFAULT nextval('public.gajis_id_seq'::regclass);
 7   ALTER TABLE public.gajis ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            ?
           2604    40581    lembur_permissions id    DEFAULT     ~   ALTER TABLE ONLY public.lembur_permissions ALTER COLUMN id SET DEFAULT nextval('public.lembur_permissions_id_seq'::regclass);
 D   ALTER TABLE public.lembur_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    231    231            ?
           2604    40275    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    197    196    197            ?
           2604    40294    multi_files id    DEFAULT     p   ALTER TABLE ONLY public.multi_files ALTER COLUMN id SET DEFAULT nextval('public.multi_files_id_seq'::regclass);
 =   ALTER TABLE public.multi_files ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200    201            ?
           2604    40349 
   offices id    DEFAULT     h   ALTER TABLE ONLY public.offices ALTER COLUMN id SET DEFAULT nextval('public.offices_id_seq'::regclass);
 9   ALTER TABLE public.offices ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            ?
           2604    40370    positions id    DEFAULT     l   ALTER TABLE ONLY public.positions ALTER COLUMN id SET DEFAULT nextval('public.positions_id_seq'::regclass);
 ;   ALTER TABLE public.positions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209            ?
           2604    40440    shift_employees id    DEFAULT     x   ALTER TABLE ONLY public.shift_employees ALTER COLUMN id SET DEFAULT nextval('public.shift_employees_id_seq'::regclass);
 A   ALTER TABLE public.shift_employees ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            ?
           2604    40503    shift_permissions id    DEFAULT     |   ALTER TABLE ONLY public.shift_permissions ALTER COLUMN id SET DEFAULT nextval('public.shift_permissions_id_seq'::regclass);
 C   ALTER TABLE public.shift_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            ?
           2604    40424 	   shifts id    DEFAULT     f   ALTER TABLE ONLY public.shifts ALTER COLUMN id SET DEFAULT nextval('public.shifts_id_seq'::regclass);
 8   ALTER TABLE public.shifts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            ?
           2604    40568    tests id    DEFAULT     d   ALTER TABLE ONLY public.tests ALTER COLUMN id SET DEFAULT nextval('public.tests_id_seq'::regclass);
 7   ALTER TABLE public.tests ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            ?
           2604    40322    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            ?          0    40405    checkins 
   TABLE DATA           ?   COPY public.checkins (id, employee_id, checkin_time, checkout_time, lat, lng, address, status, created_at, updated_at) FROM stdin;
    public          postgres    false    213   ??       ?          0    40304 	   companies 
   TABLE DATA           j   COPY public.companies (id, name, file_id, remember_token, deleted_at, created_at, updated_at) FROM stdin;
    public          postgres    false    203   ??       ?          0    40476    cuti_permissions 
   TABLE DATA           ?   COPY public.cuti_permissions (id, employee_id, cuti_id, status_id, start_date, expired_date, reason, file_id, created_at, updated_at) FROM stdin;
    public          postgres    false    221   ??       ?          0    40460    cutis 
   TABLE DATA           X   COPY public.cutis (id, company_id, cuti_name, code, created_at, updated_at) FROM stdin;
    public          postgres    false    219   R?       ?          0    40547    early_checkouts 
   TABLE DATA           b   COPY public.early_checkouts (id, checkin_id, reason, file_id, created_at, updated_at) FROM stdin;
    public          postgres    false    227   ??       ?          0    40383 	   employees 
   TABLE DATA           |   COPY public.employees (id, user_id, name, nip, position_id, status, kontak, deleted_at, created_at, updated_at) FROM stdin;
    public          postgres    false    211   ??       ?          0    40280    files 
   TABLE DATA           ]   COPY public.files (id, path, file_name, extension, size, created_at, updated_at) FROM stdin;
    public          postgres    false    199   ??       ?          0    40534    gajis 
   TABLE DATA           N   COPY public.gajis (id, employee_id, gaji, created_at, updated_at) FROM stdin;
    public          postgres    false    225   `?       ?          0    40578    lembur_permissions 
   TABLE DATA           ?   COPY public.lembur_permissions (id, employee_id, schedule_in, schedule_out, date, status_id, reason, file_id, created_at, updated_at) FROM stdin;
    public          postgres    false    231   }?       ?          0    40272 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public          postgres    false    197   ??       ?          0    40291    multi_files 
   TABLE DATA           [   COPY public.multi_files (id, id_file, id_parent, type, created_at, updated_at) FROM stdin;
    public          postgres    false    201   ?       ?          0    40346    offices 
   TABLE DATA           r   COPY public.offices (id, company_id, office_name, lat, lng, address, file_id, created_at, updated_at) FROM stdin;
    public          postgres    false    207   "?       ?          0    40367 	   positions 
   TABLE DATA           c   COPY public.positions (id, company_id, position_name, "group", created_at, updated_at) FROM stdin;
    public          postgres    false    209   J?       ?          0    40437    shift_employees 
   TABLE DATA           n   COPY public.shift_employees (id, company_id, employee_id, shift_id, date, created_at, updated_at) FROM stdin;
    public          postgres    false    217   ??       ?          0    40500    shift_permissions 
   TABLE DATA           ?   COPY public.shift_permissions (id, employee1_id, employee2_id, shift_employee1_id, shift_employee2_id, status_id, reason, file_id, created_at, updated_at) FROM stdin;
    public          postgres    false    223   ^?       ?          0    40421    shifts 
   TABLE DATA           u   COPY public.shifts (id, company_id, shift_name, code, schedule_in, schedule_out, created_at, updated_at) FROM stdin;
    public          postgres    false    215   ??       ?          0    40565    tests 
   TABLE DATA           J   COPY public.tests (id, name, file_id, created_at, updated_at) FROM stdin;
    public          postgres    false    229   ??       ?          0    40319    users 
   TABLE DATA           ?   COPY public.users (id, username, email, email_verified_at, password, company_id, file_id, admin, aktif, remember_token, deleted_at, created_at, updated_at) FROM stdin;
    public          postgres    false    205   ??       ?           0    0    checkins_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.checkins_id_seq', 13, true);
          public          postgres    false    212            ?           0    0    companies_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.companies_id_seq', 1, true);
          public          postgres    false    202            ?           0    0    cuti_permissions_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.cuti_permissions_id_seq', 3, true);
          public          postgres    false    220            ?           0    0    cutis_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.cutis_id_seq', 3, true);
          public          postgres    false    218            ?           0    0    early_checkouts_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.early_checkouts_id_seq', 1, false);
          public          postgres    false    226            ?           0    0    employees_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.employees_id_seq', 5, true);
          public          postgres    false    210            ?           0    0    files_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.files_id_seq', 6, true);
          public          postgres    false    198            ?           0    0    gajis_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.gajis_id_seq', 1, false);
          public          postgres    false    224            ?           0    0    lembur_permissions_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.lembur_permissions_id_seq', 2, true);
          public          postgres    false    230            ?           0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 17, true);
          public          postgres    false    196            ?           0    0    multi_files_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.multi_files_id_seq', 1, false);
          public          postgres    false    200            ?           0    0    offices_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.offices_id_seq', 9, true);
          public          postgres    false    206            ?           0    0    positions_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.positions_id_seq', 3, true);
          public          postgres    false    208            ?           0    0    shift_employees_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.shift_employees_id_seq', 19, true);
          public          postgres    false    216            ?           0    0    shift_permissions_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.shift_permissions_id_seq', 8, true);
          public          postgres    false    222            ?           0    0    shifts_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.shifts_id_seq', 5, true);
          public          postgres    false    214                        0    0    tests_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.tests_id_seq', 1, false);
          public          postgres    false    228                       0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 5, true);
          public          postgres    false    204                       2606    40413    checkins checkins_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.checkins
    ADD CONSTRAINT checkins_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.checkins DROP CONSTRAINT checkins_pkey;
       public            postgres    false    213            ?
           2606    40316    companies companies_name_unique 
   CONSTRAINT     Z   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_name_unique UNIQUE (name);
 I   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_name_unique;
       public            postgres    false    203            ?
           2606    40309    companies companies_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_pkey;
       public            postgres    false    203                       2606    40482 &   cuti_permissions cuti_permissions_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.cuti_permissions
    ADD CONSTRAINT cuti_permissions_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.cuti_permissions DROP CONSTRAINT cuti_permissions_pkey;
       public            postgres    false    221                       2606    40468    cutis cutis_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.cutis
    ADD CONSTRAINT cutis_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.cutis DROP CONSTRAINT cutis_pkey;
       public            postgres    false    219                       2606    40552 $   early_checkouts early_checkouts_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.early_checkouts
    ADD CONSTRAINT early_checkouts_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.early_checkouts DROP CONSTRAINT early_checkouts_pkey;
       public            postgres    false    227            	           2606    40392    employees employees_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    211            ?
           2606    40288    files files_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.files DROP CONSTRAINT files_pkey;
       public            postgres    false    199                       2606    40539    gajis gajis_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.gajis
    ADD CONSTRAINT gajis_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.gajis DROP CONSTRAINT gajis_pkey;
       public            postgres    false    225                       2606    40584 *   lembur_permissions lembur_permissions_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.lembur_permissions
    ADD CONSTRAINT lembur_permissions_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.lembur_permissions DROP CONSTRAINT lembur_permissions_pkey;
       public            postgres    false    231            ?
           2606    40277    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            postgres    false    197            ?
           2606    40296    multi_files multi_files_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.multi_files
    ADD CONSTRAINT multi_files_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.multi_files DROP CONSTRAINT multi_files_pkey;
       public            postgres    false    201                       2606    40354    offices offices_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.offices
    ADD CONSTRAINT offices_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.offices DROP CONSTRAINT offices_pkey;
       public            postgres    false    207                       2606    40375    positions positions_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.positions DROP CONSTRAINT positions_pkey;
       public            postgres    false    209                       2606    40442 $   shift_employees shift_employees_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.shift_employees
    ADD CONSTRAINT shift_employees_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.shift_employees DROP CONSTRAINT shift_employees_pkey;
       public            postgres    false    217                       2606    40506 (   shift_permissions shift_permissions_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.shift_permissions
    ADD CONSTRAINT shift_permissions_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.shift_permissions DROP CONSTRAINT shift_permissions_pkey;
       public            postgres    false    223                       2606    40429    shifts shifts_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.shifts
    ADD CONSTRAINT shifts_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.shifts DROP CONSTRAINT shifts_pkey;
       public            postgres    false    215                       2606    40570    tests tests_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.tests DROP CONSTRAINT tests_pkey;
       public            postgres    false    229            ?
           2606    40343    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public            postgres    false    205                       2606    40329    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    205                       2606    40341    users users_username_unique 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_unique UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_unique;
       public            postgres    false    205            '           2606    40414 %   checkins checkins_employee_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.checkins
    ADD CONSTRAINT checkins_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES public.employees(id);
 O   ALTER TABLE ONLY public.checkins DROP CONSTRAINT checkins_employee_id_foreign;
       public          postgres    false    213    211    2825                       2606    40310 #   companies companies_file_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_file_id_foreign FOREIGN KEY (file_id) REFERENCES public.files(id);
 M   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_file_id_foreign;
       public          postgres    false    2807    199    203            .           2606    40488 1   cuti_permissions cuti_permissions_cuti_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.cuti_permissions
    ADD CONSTRAINT cuti_permissions_cuti_id_foreign FOREIGN KEY (cuti_id) REFERENCES public.cutis(id);
 [   ALTER TABLE ONLY public.cuti_permissions DROP CONSTRAINT cuti_permissions_cuti_id_foreign;
       public          postgres    false    219    221    2833            -           2606    40483 5   cuti_permissions cuti_permissions_employee_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.cuti_permissions
    ADD CONSTRAINT cuti_permissions_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES public.employees(id);
 _   ALTER TABLE ONLY public.cuti_permissions DROP CONSTRAINT cuti_permissions_employee_id_foreign;
       public          postgres    false    221    2825    211            /           2606    40493 1   cuti_permissions cuti_permissions_file_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.cuti_permissions
    ADD CONSTRAINT cuti_permissions_file_id_foreign FOREIGN KEY (file_id) REFERENCES public.files(id);
 [   ALTER TABLE ONLY public.cuti_permissions DROP CONSTRAINT cuti_permissions_file_id_foreign;
       public          postgres    false    2807    221    199            ,           2606    40469    cutis cutis_company_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.cutis
    ADD CONSTRAINT cutis_company_id_foreign FOREIGN KEY (company_id) REFERENCES public.companies(id);
 H   ALTER TABLE ONLY public.cutis DROP CONSTRAINT cutis_company_id_foreign;
       public          postgres    false    203    219    2813            6           2606    40553 2   early_checkouts early_checkouts_checkin_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.early_checkouts
    ADD CONSTRAINT early_checkouts_checkin_id_foreign FOREIGN KEY (checkin_id) REFERENCES public.checkins(id);
 \   ALTER TABLE ONLY public.early_checkouts DROP CONSTRAINT early_checkouts_checkin_id_foreign;
       public          postgres    false    2827    227    213            7           2606    40558 /   early_checkouts early_checkouts_file_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.early_checkouts
    ADD CONSTRAINT early_checkouts_file_id_foreign FOREIGN KEY (file_id) REFERENCES public.files(id);
 Y   ALTER TABLE ONLY public.early_checkouts DROP CONSTRAINT early_checkouts_file_id_foreign;
       public          postgres    false    199    227    2807            %           2606    40393 '   employees employees_position_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_position_id_foreign FOREIGN KEY (position_id) REFERENCES public.positions(id);
 Q   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_position_id_foreign;
       public          postgres    false    2823    211    209            &           2606    40398 #   employees employees_user_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);
 M   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_user_id_foreign;
       public          postgres    false    211    205    2817            5           2606    40540    gajis gajis_employee_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.gajis
    ADD CONSTRAINT gajis_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES public.employees(id);
 I   ALTER TABLE ONLY public.gajis DROP CONSTRAINT gajis_employee_id_foreign;
       public          postgres    false    225    211    2825            9           2606    40585 9   lembur_permissions lembur_permissions_employee_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.lembur_permissions
    ADD CONSTRAINT lembur_permissions_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES public.employees(id);
 c   ALTER TABLE ONLY public.lembur_permissions DROP CONSTRAINT lembur_permissions_employee_id_foreign;
       public          postgres    false    231    211    2825            :           2606    40590 5   lembur_permissions lembur_permissions_file_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.lembur_permissions
    ADD CONSTRAINT lembur_permissions_file_id_foreign FOREIGN KEY (file_id) REFERENCES public.files(id);
 _   ALTER TABLE ONLY public.lembur_permissions DROP CONSTRAINT lembur_permissions_file_id_foreign;
       public          postgres    false    231    199    2807                       2606    40297 '   multi_files multi_files_id_file_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.multi_files
    ADD CONSTRAINT multi_files_id_file_foreign FOREIGN KEY (id_file) REFERENCES public.files(id);
 Q   ALTER TABLE ONLY public.multi_files DROP CONSTRAINT multi_files_id_file_foreign;
       public          postgres    false    2807    199    201            "           2606    40355 "   offices offices_company_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.offices
    ADD CONSTRAINT offices_company_id_foreign FOREIGN KEY (company_id) REFERENCES public.companies(id);
 L   ALTER TABLE ONLY public.offices DROP CONSTRAINT offices_company_id_foreign;
       public          postgres    false    203    207    2813            #           2606    40360    offices offices_file_id_foreign    FK CONSTRAINT     ~   ALTER TABLE ONLY public.offices
    ADD CONSTRAINT offices_file_id_foreign FOREIGN KEY (file_id) REFERENCES public.files(id);
 I   ALTER TABLE ONLY public.offices DROP CONSTRAINT offices_file_id_foreign;
       public          postgres    false    199    2807    207            $           2606    40376 &   positions positions_company_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_company_id_foreign FOREIGN KEY (company_id) REFERENCES public.companies(id);
 P   ALTER TABLE ONLY public.positions DROP CONSTRAINT positions_company_id_foreign;
       public          postgres    false    203    209    2813            )           2606    40443 2   shift_employees shift_employees_company_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.shift_employees
    ADD CONSTRAINT shift_employees_company_id_foreign FOREIGN KEY (company_id) REFERENCES public.companies(id);
 \   ALTER TABLE ONLY public.shift_employees DROP CONSTRAINT shift_employees_company_id_foreign;
       public          postgres    false    2813    217    203            *           2606    40448 3   shift_employees shift_employees_employee_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.shift_employees
    ADD CONSTRAINT shift_employees_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES public.employees(id);
 ]   ALTER TABLE ONLY public.shift_employees DROP CONSTRAINT shift_employees_employee_id_foreign;
       public          postgres    false    2825    211    217            +           2606    40453 0   shift_employees shift_employees_shift_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.shift_employees
    ADD CONSTRAINT shift_employees_shift_id_foreign FOREIGN KEY (shift_id) REFERENCES public.shifts(id);
 Z   ALTER TABLE ONLY public.shift_employees DROP CONSTRAINT shift_employees_shift_id_foreign;
       public          postgres    false    2829    217    215            0           2606    40507 8   shift_permissions shift_permissions_employee1_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.shift_permissions
    ADD CONSTRAINT shift_permissions_employee1_id_foreign FOREIGN KEY (employee1_id) REFERENCES public.employees(id);
 b   ALTER TABLE ONLY public.shift_permissions DROP CONSTRAINT shift_permissions_employee1_id_foreign;
       public          postgres    false    223    2825    211            1           2606    40512 8   shift_permissions shift_permissions_employee2_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.shift_permissions
    ADD CONSTRAINT shift_permissions_employee2_id_foreign FOREIGN KEY (employee2_id) REFERENCES public.employees(id);
 b   ALTER TABLE ONLY public.shift_permissions DROP CONSTRAINT shift_permissions_employee2_id_foreign;
       public          postgres    false    2825    211    223            4           2606    40527 3   shift_permissions shift_permissions_file_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.shift_permissions
    ADD CONSTRAINT shift_permissions_file_id_foreign FOREIGN KEY (file_id) REFERENCES public.files(id);
 ]   ALTER TABLE ONLY public.shift_permissions DROP CONSTRAINT shift_permissions_file_id_foreign;
       public          postgres    false    199    2807    223            2           2606    40517 >   shift_permissions shift_permissions_shift_employee1_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.shift_permissions
    ADD CONSTRAINT shift_permissions_shift_employee1_id_foreign FOREIGN KEY (shift_employee1_id) REFERENCES public.shift_employees(id);
 h   ALTER TABLE ONLY public.shift_permissions DROP CONSTRAINT shift_permissions_shift_employee1_id_foreign;
       public          postgres    false    223    2831    217            3           2606    40522 >   shift_permissions shift_permissions_shift_employee2_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.shift_permissions
    ADD CONSTRAINT shift_permissions_shift_employee2_id_foreign FOREIGN KEY (shift_employee2_id) REFERENCES public.shift_employees(id);
 h   ALTER TABLE ONLY public.shift_permissions DROP CONSTRAINT shift_permissions_shift_employee2_id_foreign;
       public          postgres    false    2831    223    217            (           2606    40430     shifts shifts_company_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.shifts
    ADD CONSTRAINT shifts_company_id_foreign FOREIGN KEY (company_id) REFERENCES public.companies(id);
 J   ALTER TABLE ONLY public.shifts DROP CONSTRAINT shifts_company_id_foreign;
       public          postgres    false    2813    215    203            8           2606    40571    tests tests_file_id_foreign    FK CONSTRAINT     z   ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_file_id_foreign FOREIGN KEY (file_id) REFERENCES public.files(id);
 E   ALTER TABLE ONLY public.tests DROP CONSTRAINT tests_file_id_foreign;
       public          postgres    false    2807    199    229            !           2606    40335    users users_company_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_company_id_foreign FOREIGN KEY (company_id) REFERENCES public.companies(id);
 H   ALTER TABLE ONLY public.users DROP CONSTRAINT users_company_id_foreign;
       public          postgres    false    205    2813    203                        2606    40330    users users_file_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_file_id_foreign FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_file_id_foreign;
       public          postgres    false    2807    199    205            ?   ?   x????N?0?s?~?4??.iv'h??eo??Ц([?x{?IH=t??????Y??ae??`?6vmP?w?????k?ƋW?2<N?S?IǱ?g???a???ĹT??)?+???-?jc}P???1?Sǂ/d?.?~?t??RPsU:m)?-64M?k?Db?kx?2?c?v?v???8??"??&???S??0}?9?y8???6?_???p??>?{-???u??      ?   5   x?3?I-.Qp??-H̫????"##C]#]CSC+3+S#lb\1z\\\ U?      ?   ]   x?3?4?4a#C]#]C$??M?]bB)?;d??
?FVVF?hb&?VF?\?`ӑԛ!3?旤?`1??
h??1?????%W? _%?      ?   c   x?3?4?t.-?TI?(?K??t?4202?50?54U04?2??2??&?e?듘?Y?냢?????????1L?_fvb???*?*#lb\1z\\\ ??&?      ?      x?????? ? ?      ?   ?   x?m?KN?@ׯO??????!X??M#??f$????d?,]?Ke????{Ahq???ɂ<p?0J&?O`??2O??k.???I??jI?~??\?n??泠?u.?Je>
ٝ???v]ڵ?וp??	???3V?#?w?j2?ϟ??^???ZT=?yu????K????s??l???=<??u[??-VfZ????R???Qn      ?   ?   x?uЫ?P?a?>/???s?K,??y?X??KO?V????6?Ǟ?D,;??y???[F??a??{?a??5j??)?k?"5n ;???襵?TM??cT?D/?A?45??q]K??L?f?|?W?X????o?T<??5h??)j? ?.?t?      ?      x?????? ? ?      ?   Y   x?3?4?4??20 "NC3+C????P??H?ȀӀ?=1??D!%??471CG!75/%3/]!;?(+?????T?????L??q??qqq ~??      ?     x?m??n? E?׏i????%إ??>???U`?ķ{?ps?g??O&???F{??W?H!д????x????ِr|ˑ?`?ɗH1If?}????(???+???ǟT;:?????w5?;`;ͣ????0'?Т&s????S??T?f|?nn???L?
=y??ᛖ?Sp,`??
?W$??뒤?.???ī?]]???la*?????d&5??1t????!?Z??????v'?P?]&S{	:??t]????M?????-      ?      x?????? ? ?      ?     x?}?Kn?0???)x ???M??h? i???&???8?-????=Q?Ctd?iиՊ?s8?3???8????c????rY??܃??x{???={?4}?????BB%d???E??8???:??Ӛ?T?P_K%A??6?p??s? ޙ?b???}?Gv???gV,??B??~???]??vS?p?.㊳e$?eK?9)yD??s?W?E5?f?>?&?8??7????A??J?{Z????ӌ????k?	???":aBRi?8?2y?Sf?q??????`?e??*??0?p?????B	?_???k?Ni?!?eܶ?D;9????$>?|????8mB;???zW|N	?ذی??&??`?`o???????wm7?3?n???tsx?'A????$?V4~{J+-?\?>"??R(ÝQ?U??"?????	?Z-?4ŏoߍ??f???51o??=??????1?c8??y?%?M??-p?ء?	??֯L?Z??&\?@??:????(??W?ɠ?)??t???W????
???
????Ni?=/??'???      ?   a   x?3?4??/?,???SI-.?FF??F???
?V?V?ĸ?е+?0BQmhednej?.faed?e4?#????M@z???q??qqq ??(2      ?   ?   x?u??? ??x?.@??!2A?????J?#??&c)?$?$?_[??#??};??&C(?
>e??Qꄊ?&?z??a	????1?E?C?!?C%???}J?K|W?C?1???r7름???)?şo"? @?_?      ?   ?   x?m?1
?0Eg??@ZK?eG???c??????Tu??H?????B???u~??4?(]?-?<b???@t?r?????۱??f?2b???u??3?F䍹?͙??6@eX?FP?{????b1??E?튈o??>+      ?   ?   x???1
?0Eg??@?$?u???&?%KA
m???USS:x(h?<x?/?iY???0%?>??KnIZ?Q?C???{3?+???ÿE????7}?I?3ɗ?kuQBt???[Sևn?/?!RYd??VaN?zB??@:S      ?      x?????? ? ?      ?   ?  x?}?A??@???+??u???8Mq?8??4ݢ ??(?~u?v$???K^*??TἭ?????H?\??(|?? ^@?Xٟ2??ek???BB/?S]P?Eh\?	?????T?]????B~?}?m?]*?(??_ ??0?P?'?z??t?N??~?C??+W??'??-W?,	
j#o?6U?X???b\?????ލ?HHxq&??^$ȃ?Q?<??Ѻ?_'R???J?Ѩ?4v??ߛPS??r?KN??@Jn??M??=??CHTF?:?0?
s;#Y{`q/'?V;??Gu?J???0?v~????`?n$+N?b	%?[[?\?+???85=??X???p 	?????2??s4?ߚns?3Րfvc?m?N?m???o???Zp?k?)?^?Q?'~J?(?Z??I     