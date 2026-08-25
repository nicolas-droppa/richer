class HomePresenter
  attr_accessor :categories

  def initialize(view_context)
    @categories = Category.includes(:transactions).all
    @transactions = Transaction.all
    @view_context = view_context
  end

  def spending_summary
    "#{@view_context.number_to_currency total_sum} in #{total_count} transaction(s)."
  end

  def total_sum
    @transactions.map(&:amount).sum
  end

  def total_count
    @transactions.count
  end

  def average_transaction
    @view_context.number_to_currency(total_sum / total_count)
  end

  def sum_for_category(category)
    @view_context.number_to_currency category.transactions.map(&:amount).sum
  end
end