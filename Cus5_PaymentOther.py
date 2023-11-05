from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/reservation', methods=['POST'])
def reservation():
    if request.method == 'POST':
        fullname = request.form['fullname']
        phonenumber = request.form['phonenumber']
        pinnumber = request.form['pinnumber']
        pay_app = request.form['pay_app']
         #add logic here
        return f'Full name: {fullname}, Phone number: {phonenumber}, Pin: {pinnumber}, Payed via: {pay_app}'
       
        
    return render_template('Cus5_PaymentOther.html')

if __name__ == '__main__':
    app.run(debug=True)
