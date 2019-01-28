require 'json'
require 'time'

# votre code

  def prices_calculator(input_json)
    # isolates practitioners
    @practitioners = input_json['practitioners']
    # isolates communications
    @communications = input_json['communications']
    # extract uniques dates
    @dates = []
    @communications.each do |communication|
      @dates << Time.parse(communication.values_at('sent_at')[0]).strftime('%F')
    end
    @dates = @dates.uniq
    # initiate 'totals' array
    @totalsarray = []
    # iterates over each unique date
    @dates.each do |date|
      @total = 0
      # for each date, iterates over each communication
      @communications.each do |communication|
        if communication['sent_at'].include?(date.to_s)
          # defines the 4 parameters of the final formula
          add_pages = (communication['pages_number'].to_i - 1) * 0.07
          color = (communication['color'] == true ? 1 : 0) * 0.18
          practitioner = @practitioners.fetch(communication['practitioner_id'] - 1)
          express = (practitioner['express_delivery'] == true ? 1 : 0) * 0.6
          # final formula
          @total += 0.1 + color + add_pages + express
        end
      end
      # store each daily total in 'totals' array
      @totalsarray << { 'sent_on' => date, 'total' => @total.round(2) }
    end
    { 'totals' => @totalsarray }
  end
