puts 'Creating Events'

Event.create(
  name: 'event1',
  start_date: Date.today - 2,
  end_date: Date.today + 5
)

Event.create(
  name: 'event2',
  start_date: Date.today - 10,
  end_date: Date.today - 5
)

Event.create(
  name: 'event3',
  start_date: Date.today + 20,
  end_date: Date.today + 25
)