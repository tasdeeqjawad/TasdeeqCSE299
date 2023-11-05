from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/ticketreservation', methods=['POST', 'GET'])
def ticket_reservation():
    if request.method == 'POST':
        from_station = request.form['from_station']
        to_station = request.form['to_station']
        coach_type = request.form['coach_type']
        seating_preference = request.form['seating_preference']
        departure_date = request.form['departure_date']
        passenger_count = request.form['passenger_count']
        number_of_seats = request.form['number_of_seats']
        full_name = request.form['full_name']
        phone_number = request.form['phone_number']
        # Add your ticket reservation logic here
        return f'From: {from_station}, To: {to_station}, Coach Type: {coach_type}, Seating Preference: {seating_preference}, Departure Date: {departure_date}, Passenger Count: {passenger_count}, Number of Seats: {number_of_seats}, Full Name: {full_name}, Phone Number: {phone_number}'
    return render_template('Reservation.html')

if __name__ == '__main__':
    app.run(debug=True)
