Courier.destroy_all
Client.destroy_all
Ticket.destroy_all

20.times do
  Courier.create!({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.safe_email,
    phone: Faker::PhoneNumber.cell_phone,
    radio_number: rand(200),
    is_active: Faker::Boolean.boolean(true_ratio: 0.3),
    is_archived: Faker::Boolean.boolean(true_ratio: 0.3),
  })
end

20.times do
  Client.create!({
    name: Faker::Company.name,
    contact_person: Faker::Name.name,
    contact_phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.full_address
  })
end

# Complete tickets
10000.times do
  Ticket.create!({
    pickup: Faker::Address.full_address,
    dropoff: Faker::Address.full_address,
    time_ready: Faker::Time.backward(days: 5000),
    time_due: Faker::Time.backward(days: 5000),
    is_rush: Faker::Boolean.boolean(true_ratio: 0.15),
    rush_details: '',
    rush_charge: 0,
    is_oversize: Faker::Boolean.boolean(true_ratio: 0.2),
    oversize_details: '',
    oversize_charge: 0,
    notes: '',
    additional_charge: 0,
    base_charge: rand(8..100),
    courier_id: Courier.all.sample.id,
    client_id: Courier.all.sample.id,
    pod: Faker::Name.name,
    time_delivered: Faker::Time.backward(days: 5000),
    is_complete: true,
    is_roundtrip: Faker::Boolean.boolean(true_ratio: 0.15),
    roundtrip_details: '',
    roundtrip_charge: 0,
    return_pod: '',
    created_at: Faker::Time.backward(days: 5000),
  })
end

# Completed jobs today
25.times do
  Ticket.create!({
    pickup: Faker::Address.full_address,
    dropoff: Faker::Address.full_address,
    time_ready: Faker::Time.backward(days: 1),
    time_due: Faker::Time.backward(days: 1),
    is_rush: Faker::Boolean.boolean(true_ratio: 0.15),
    rush_details: '',
    rush_charge: 0,
    is_oversize: Faker::Boolean.boolean(true_ratio: 0.2),
    oversize_details: '',
    oversize_charge: 0,
    notes: '',
    additional_charge: 0,
    base_charge: rand(8..100),
    courier_id: Courier.all.sample.id,
    client_id: Courier.all.sample.id,
    is_complete: true,
    is_roundtrip: Faker::Boolean.boolean(true_ratio: 0.15),
    roundtrip_details: '',
    roundtrip_charge: 0,
    return_pod: '',
    pod: Faker::Name.name,
    time_delivered: Faker::Time.backward(days: 1),
  })
end

# Incomplete Tickets
15.times do
  Ticket.create!({
    pickup: Faker::Address.full_address,
    dropoff: Faker::Address.full_address,
    time_ready: Faker::Time.backward(days: 1),
    time_due: Faker::Time.forward(days: 1),
    is_rush: Faker::Boolean.boolean(true_ratio: 0.15),
    rush_details: '',
    rush_charge: 0,
    is_oversize: Faker::Boolean.boolean(true_ratio: 0.2),
    oversize_details: '',
    oversize_charge: 0,
    notes: '',
    additional_charge: 0,
    base_charge: rand(8..100),
    courier_id: rand(10) < 3 ? nil : Courier.all.sample.id,
    client_id: Courier.all.sample.id,
    is_complete: false,
    is_roundtrip: Faker::Boolean.boolean(true_ratio: 0.15),
    roundtrip_details: '',
    roundtrip_charge: 0,
    return_pod: '',
    pod: ''
  })
end
