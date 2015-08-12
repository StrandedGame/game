--- Test function
--@param hello String to write to output
function Test(hello)
	print(hello)
end

--- Foo function
--@param bar prints a pipe character to the output
--@param nobar prints no pipe character to the output
--If none are present, prints 'foo'
function Foo(bar, nobar)
	if bar and not nobar then
		print('|')
	elseif not nobar then
		print('foo')
	end
end
	
