module ApplicationHelper
  def category_sum(group)
    total = 0
    return total if group.expenses.empty?

    group.expenses.each do |ex|
      total += ex.amount
    end
    total
  end
end
