class Question
	attr_accessor :questions


	def main 
		questions = getQuestionsAndAnswers

		puts "Ingresa tu nombre"
		name= gets.chomp
		name.capitalize!
		puts "Bienvenido a reto 5 #{name},  Para jugar, solo ingresa el termino correcto para cada una de las definiciones, Listo? Vamos!"
		puts ""
		puts ""
		questions.each {|key,value|
			puts "*******************"
			puts "     Definicion"
			puts "*******************"
			puts key
			answer = gets.chomp
			val = value.chomp
			while(answer.casecmp(val) != 0 ) do
				puts "Incorrecto!, Trata de nuevo"
				answer = gets.chomp
			end
			puts "Correcto!"
			puts ""
		}
		puts ""
		puts "Felicitaciones! Has finalizado."
	end
	
	def getQuestionsAndAnswers
		i = 1
		j = i + 3
		question = ""
		questions = Hash.new { |hash, key| hash[key] = "Question #{key}" }
		File.open("file.txt", "r") do |f|
			f.each_line do |line|
				unless line.chomp.empty?
				if(i == 1 || i==j)
					j = i + 3
					question = line
				else
					questions[question]=line
				end
			end
		  	i+=1
		    end
		end
		questions
	end
end

question = Question.new 
question.main