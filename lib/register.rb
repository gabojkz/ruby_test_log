class Register
  attr_accessor :order, :unique, :list, :pages
  # @order [desc, asc] display the result by order
  # @unique boolean [true, false] If false it count all the IPs including not uniques ones
  def initialize(data, order='desc', unique=false)
    @data = data || []
    @order = order.downcase
    @unique = unique
    @list = {}

    generate_list()
  end

  def print_list
    @pages = combine()
    @pages = sorting(@pages)

    if @pages.empty?
      puts "Nothing to print the list is empty"
    else
      @pages.each do |page|
        if @unique
          puts "#{page[0]} | #{page[1]} unique views"
        else 
          puts "#{page[0]} | #{page[1]} visits"
        end
      end
    end
  end

  private 
  def generate_list
    @data.each do | record |
      page = record[0]
      ip   = record[1]

      if @list[page].nil?
        @list[page] = []
      end

      @list[page].push(ip)
    end
  end

  def sorting(pages)
    # def order desc
    pages_ordered = pages.sort { |a, b| b[1] <=> a[1] }

    if @order == 'asc'
      pages_ordered = pages_ordered.reverse()
    end

    return pages_ordered
  end


  def combine
    list_combined = []

    @list.each do | title, ip_address|
      if @unique
        ip_address = ip_address.uniq
      end
      list_combined.push([ title,  ip_address.count ])
    end

    return list_combined
  end
end