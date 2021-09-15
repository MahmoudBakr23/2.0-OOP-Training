class Classroom
    attr_accessor :label
    attr_reader :students

    students = []

    def initialize(label, _student)
        @label = label
        @students = []
    end

    def add_students(student)
        students.push(student)
        student.classroom = self
    end
end