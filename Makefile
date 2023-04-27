.PHONY: clean All

All:
	@echo "----------Building project:[ flex_and_bison - Debug ]----------"
	@"$(MAKE)" -f  "flex_and_bison.mk"
clean:
	@echo "----------Cleaning project:[ flex_and_bison - Debug ]----------"
	@"$(MAKE)" -f  "flex_and_bison.mk" clean
