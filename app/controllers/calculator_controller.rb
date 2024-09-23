class CalculatorController < ApplicationController

  #Forms page
  def square
    render(:template=> "calculator_templates/square_template")
  end

  def square_root
    render(:template=> "calculator_templates/square_root_template")
  end

  def payment
    render(:template=> "calculator_templates/payment_template")
  end

  def random
    render(:template=> "calculator_templates/random_template")
  end


  #Results page
  def square_results
    @input_number= params.fetch("square_number").to_f
    @squared=@input_number ** 2.0
    render(:template=> "calculator_templates/square_results_template")
  end

  def square_root_results
    @input_number= params.fetch("root_number").to_f
    @square_rooted=@input_number ** 0.5
    render(:template=> "calculator_templates/square_root_results_template")
  end

  def payment_results
    @apr= params.fetch("apr_input").to_f
    @years= params.fetch("years_input").to_i
    @principal= params.fetch("principal_input").to_i
    r=(@apr/100)/12
    n=@years * 12
    numerator= r * @principal
    denominator= 1 - ((1 + r)**(-n))
    @payment= numerator / denominator
    render(:template=> "calculator_templates/payment_results_template")
  end

  def random_results
    @min= params.fetch("min_input").to_f
    @max= params.fetch("max_input").to_f
    @random_number=rand(@min..@max)
    render(:template=> "calculator_templates/random_results_template")
  end

end 
