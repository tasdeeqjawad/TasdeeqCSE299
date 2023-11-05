from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/payment', methods=['POST'])
def payment():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        pincode = request.form['pincode']
        card_type = request.form['card_type']
        card_number = request.form['card_number']
        exp_date = request.form['exp_date']
        cvv = request.form['cvv']

        # Process the data as needed, for example, printing the data to the console
        print(f'Name: {name}')
        print(f'Email: {email}')
        print(f'Pincode: {pincode}')
        print(f'Card Type: {card_type}')
        print(f'Card Number: {card_number}')
        print(f'Expiration Date: {exp_date}')
        print(f'CVV: {cvv}')

        # Return a response or render a template
        return "Data received successfully!"

if __name__ == '__main__':
    app.run(debug=True)
