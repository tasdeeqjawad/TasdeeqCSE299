from flask import Flask, request, render_template
import sqlite3

Cus3_RegisterPageApp = Flask(__name__)

@Cus3_RegisterPageApp.route('/userreg', methods=['POST', 'GET'])
def user_registration():
    if request.method == 'POST':
        email = request.form['mailid']
        password = request.form['pword']
        first_name = request.form['firstname']
        last_name = request.form['lastname']
        phone_number = request.form['phoneno']
        conn = sqlite3.connect('train_booking.sql') 
        cursor = conn.cursor()

    
        cursor.execute("INSERT INTO customer (Fname, Lname, Email, Passwrd, Phone) VALUES (?, ?, ?, ?, ?)", (first_name, last_name, email, password, phone_number ))

    
    

        conn.close()
        # Add your user registration logic here
        return f'Email: {email}, Password: {password}, First Name: {first_name}, Last Name: {last_name}, Phone Number: {phone_number}'
    return render_template('Cus2_LoginPage.html')

if __name__ == '__main__':
    Cus3_RegisterPageApp.run(debug=True)
