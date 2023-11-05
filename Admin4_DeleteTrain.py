from flask import Flask, request, render_template
import sqlite3

Admin4_DeleteTrainApp = Flask(__name__)

@Admin4_DeleteTrainApp.route('/admincanceltrain', methods=['POST', 'GET'])
def admin_cancel_train():
    if request.method == 'POST':
        train_number = request.form['trainno']

        conn = sqlite3.connect('train_booking.sql') 
        cursor = conn.cursor()

    
        cursor.execute("DELETE FROM train WHERE Train_No = ?", (train_number,))

        # Add your train deletion logic here
        return f'Train Number {train_number} has been deleted.'
    return render_template('Admin4_DeleteTrain.html')
    #return render_template('Admin2_HomePage')

if __name__ == '__main__':
    Admin4_DeleteTrainApp.run(debug=True)
