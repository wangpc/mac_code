# encoding: utf-8

module TestMo
	def func_1
		p self
	end

	def self.func_2
		p 'func_2'
	end

	module_function :func_1
end


TestMo.func_1
TestMo.func_2