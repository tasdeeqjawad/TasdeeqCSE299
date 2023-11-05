from flask import Flask, request, render_template
import sqlite3

Admin3_AddTrainPageApp = Flask(__name__)

@Admin3_AddTrainPageApp.route('/adminaddtrain', methods=['POST', 'GET'])
def admin_add_train():
    if request.method == 'POST':
        train_number = request.form['trainno']
        train_name = request.form['trainname']
        from_station = request.form['fromstation']
        to_station = request.form['tostation']
        available = request.form['available']
        fare = request.form['fare']
        conn = sqlite3.connect('train_booking.sql') 
        cursor = conn.cursor()

    
        cursor.execute("INSERT INTO train (Train_No, Name_of_Trains, Starting_Station, Arrival_station) VALUES (?, ?, ?, ?)", (train_number, train_name, from_station, to_station ))
        cursor.execute("INSERT INTO seats (ticket_price, train_no) VALUES (?, ?)", (fare, train_number))

        conn.close()
        # Add your train addition logic here
        return f'Train Number: {train_number}, Train Name: {train_name}, From: {from_station}, To: {to_station}, Available: {available}, Fare: {fare}'
    return render_template('Admin3_AddTrainPage.html')
    #return render_template ('Admin2_HomePage.html')    #Currently inactive this line but after successful adding it should go back to admin home

if __name__ == '__main__':
    Admin3_AddTrainPageApp.run(debug=True)
