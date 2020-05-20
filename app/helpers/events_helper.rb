module EventsHelper

  def show_ticket_price(user: , ticket:)
    format_ticket_amount(
      ticket.currency, 
      amount_after_gender_discount(user, ticket.amount)
    )
  end

  def event_date(event: event)
    event.start_date.strftime('%d/%m/%y') + ' - ' + event.end_date.strftime('%d/%m/%y')
  end

  def original_ticket_price(ticket:)
    format_ticket_amount(
      ticket.currency, 
      ticket.amount.to_s
    )
  end

  def event_registration_cta(user: user, event: event, ticket: ticket)
    if user_is_attending_event?(user, event)
      link_to 'Unattend', delete_participant_event_path(id: event.id), :method => :delete, data: {:confirm => "You sure?" }, class: "btn btn-primary", remote: true
    else
      link_to 'Attend', create_participant_event_path(id: event.id, ticket_id: ticket), :method => :post, class: "btn btn-primary", remote: true
    end
  end

  def event_participation_allowed?(user, event)
    user && !event.past?
  end

  private

  def format_ticket_amount(currency, amount)
    currency + ' ' + amount
  end

  def user_is_attending_event?(user, event)
    user.attending_event?(event)
  end

  def discount_price(original:)
    original - original*Ticket::FEMALE_DISCOUNT
  end

  def amount_after_gender_discount(user, amount)
    price = user.female? ? discount_price(original: amount) : amount
    price.to_s
  end
end
