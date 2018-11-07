.PHONY = makefiles delete_txt write_to var_message git_hash home_dir check_value var_def check_var origin_check

MESSAGE = Hello World
ENV_VAR = $(shell env | grep TEST)
COM_VAR = $(shell echo -n ${TEST})
TEST = Hello

makefiles:
	@touch file1.txt file2.txt file3.txt file4.txt file5.txt

delete_txt:
	@find . -name '*.txt' -delete

write_to_read:
	@touch document.txt
	@echo "This is some text that will be put in a file" > document.txt
	@cat document.txt

var_message:
	@echo $(MESSAGE)

git_hash:
	@git ls-remote git://github.com/munir505/Python-Http-Server | grep HEAD

home_dir:
	@echo $(HOME)

check_value:
ifneq (,$(findstring m,$(HOME)))
	@echo "Found M, ERROR"
else
	@echo $(HOME)
endif

var_def:
ifdef MESSAGE
	@echo $(MESSAGE)
	@echo "Not Empty"
else 
	@echo "Variable is Empty"
endif

check_var:
	@echo $(ENV_VAR)
	@echo $(COM_VAR)
ifneq ($(ENV_VAR),)
	@echo "Is Enviroment Variable"
	@echo $(ENV_VAR)
else
	@echo "Not Enviroment variable"
endif

ifneq ($(TEST),)
	@echo "Is file variable"
	@echo $(TEST)
else
	@echo "Is not file varibale"
endif

ifdef COM_VAR
	@echo "Is command line variable"
	@echo $(COM_VAR)
else
	@echo "Not Command Line Variable"
endif

origin_check:
	@echo $(origin TEST)
