# frozen_string_literal: true
require 'date'

class Students_Homework_1

    @@students = []
    attr_accessor :name
    attr_accessor :surname
    attr_accessor :birth_date
    def initialize(name, surname, birth_date)
      @name = name
      @surname = surname
      @birth_date = birth_date
      if @birth_date > Date.today
        raise ArgumentError "Invalid birth date! Please enter correct birth date"
      end

      add_student
      calculate_age
    end

    def calculate_age
      @age = Date.today.year - @birth_date.year
    end
    def self.students
      @@students
    end
    def add_student
      if self.class.students.any? { |student| student.name == @name && student.surname == @surname && student.birth_date == @birth_date }
        raise ArgumentError, "This student has already been added."
      else
        self.class.students << self
      end

    end


    def remove_student
      self.class.students.delete_if { |student| student.name == @name && student.surname == @surname && student.birth_date == @birth_date }
    end

    def self.get_students_by_age(age)
      @@students.select { |student| student.calculate_age == age }

    end

    def self.get_students_by_name(name)
      @@students.select { |student| student.name == name }
      p(name)
    end
end


