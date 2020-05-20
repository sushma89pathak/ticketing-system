puts 'Creating Events'

Ticket.create(
  name: 'ticket1',
  currency: 'USD',
  amount: 200,
  event_id: 1
)

Ticket.create(
  name: 'ticket2',
  currency: 'ASD',
  amount: 400,
  event_id: 2
)


Ticket.create(
  name: 'ticket3',
  currency: 'INR',
  amount: 1000,
  event_id: 3
)