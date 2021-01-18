create table budget.dev.budget_staging (
	trans_date varchar(100),
	src varchar(2),
	ref_num varchar(100),
	account_num varchar(100),
	fund varchar(100),
	unit varchar(100),
	obj varchar(100),
	tag varchar(100),
	gl_misc1 varchar(100),
	gl_misc2 varchar(100),
	gl_misc5 varchar(100),
	fund_desc varchar(100),
	unit_desc varchar(100),
	object_desc varchar(100),
	gl_acct_desc_cc text,
	descr text,
	debit float,
	credit float,
	proj_ref varchar(100),
	proj_title varchar(100),
	proj_type varchar(100),
	proj_current_stat varchar(100),
	gla_posted_date varchar(100),
	gla_account_id varchar(100),
	gla_term varchar(100),
	month varchar(100),
	year integer
)