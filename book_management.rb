class Book
    attr_reader :id 
    attr_accessor :book_name, :checked_out, :return_book

    @@book_id = 1
    def initialize(book_name)
        @book_name = book_name
        @id = @@book_id
        @@book_id += 1
        @checked_out = false
        @return_book = true
    end

    def to_s
        status = @checked_out ? "[Unavailable]" : (@return_book ? "[Available]" : "[Unavailable]")
        "#{@id}. #{status} #{@book_name} "
    end

    def check_out
        @checked_out = true unless @return_book == false
        @return_book = false
    end

    def return_books
        @return_book = true unless @checked_out == false
        @checked_out = false
    end

end


# Create some books

class BookManagement
    def initialize
        @books = []
    end

    def add_book(book_name)
        book = Book.new(book_name)
        @books << book
        puts "Book added with name : #{book_name} "
    end

    def checkout_book(book_id)
        book = @books.find { |b| b.id == book_id }
        book.check_out
        puts "Book #{book_id} checked out"
    end

    def list_books
        @books.each do |book|
            puts book
        end
    end

    def return_book(book_id)
        book = @books.find { |b| b.id == book_id }
        book.return_books
        puts "Book #{book_id} returned"
    end


end

def print_options
    puts "\n--- Book Manager ---"
    puts "1. Add book"
    puts "2. List book"
    puts "3. Checkout task"
    puts "4. Return book"
    puts "5. Exit"
    print "Choose an option: "
  end

  book_new = BookManagement.new

  loop do
    print_options
    choice = gets.chomp.to_i

    case choice
    when 1
      print "Enter book name: "
      book_name = gets.chomp
      book_new.add_book(book_name)
    when 2
      book_new.list_books
    when 3
      print "Enter book ID to checkout: "
      id = gets.chomp.to_i
      book_new.checkout_book(id)
    when 4
      print "Enter book ID to return: "
      id = gets.chomp.to_i
      book_new.return_book(id)
    when 5
      puts "Goodbye!"
      break
    else
      puts "Invalid option. Please try again."
    end
  end

