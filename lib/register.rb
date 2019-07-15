class Register
  # @order [desc, asc] display the result by order
  # @unique boolean [true, false] If false it count all the IPs including not uniques ones

  def initialize(data, order='asc', unique=false)
    p "Will order #{order} .."
    p "Will show unique values? #{unique} .."

    @data = data
    @order = order.downcase
    @unique = unique
    @list = {}

    generate_list()
  end

  def generate_list
  end
end
