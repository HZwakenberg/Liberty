class LIBERTY_AST_INSERT

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_PARENT]
		export
			{ANY} valid_index, count, lower, upper, item
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Insert"

end
