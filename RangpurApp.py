from flask import Flask, render_template, request
from datetime import datetime
import sqlite3

RangpurApp = Flask(__name__)

@RangourApp.route('/')
def index():
    return render_template('1Cus3.10_Ticket4Rangpur.html')

@RangpurApp.route('/RangpurResult', methods=['POST', 'GET'])
def result():
    if request.method == 'POST':
                result = request.form
        selected_value = result['dropdown']

        dropdown = request.form['dropdown']
        coach_type = request.form['coach_type']
        seating_preference = request.form['seating_preference']
        date = request.form['date']
        passenger_count = request.form['passenger_count']
        number_of_seats = request.form['number_of_seats']
        full_name = request.form['full_name']
        phone_number = request.form['phone_number']
    
        conn = sqlite3.connect('train_booking.sql') 
        cursor = conn.cursor()

        int fare

        # Extracting the train number as a variable of type integer
        train_number = int(dropdown.split()[0][1:]) if dropdown else None

        # Extracting the time as a variable of type time
        time_str = dropdown.split("(Departure time: ")[1].replace(")", "")
        departure_time = datetime.strptime(time_str, "%H:%M").time() if time_str else None

        cursor.execute("SELECT ticket_price FROM seats WHERE train_No = ?", (train_number,))

        price = cursor.fetchone()

        cursor.execute("SELECT capacity FROM seats WHERE train_No = ?", (train_number,))
        
        available = cursor.fetchone()

        #need customer ID
        if number_of_seats > available:
            #output an error message
        else:    
            
            fare = price*(number_of_seats)
            
            cursor.execute("INSERT INTO reservation (total_fare, no_of_tickets, train_no, customer_id, location_name) VALUES (?, ?, ?, ?, 'Rangpur')", (fare, number_of_seats, train_number, customer_id))
            
            cursor.execute("SELECT reservation_id FROM reservation WHERE reservation_id = last_insert_rowid()")

            reservation_id = cursor.fetchone()

            cursor.execute("INSERT INTO ticket (Depart_time, reservation_id) VALUES (?, ?)", (departure_time, reservation_id ))

            cursor.execute("UPDATE seats SET capacity = capacity - ? WHERE train_no = ?", (number_of_seats, train_number))

            #Successful message should pop-up



        return 'Selected value: {}'.format(selected_value)

if __name__ == '__main__':
    RangpurApp.run(debug=True)
