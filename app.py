import braintree

from flask import Flask, render_template, send_from_directory, request
app = Flask(__name__)

gateway = braintree.BraintreeGateway(
    braintree.Configuration(
        braintree.Environment.Sandbox,
        merchant_id="ww4ztwqr5x6kfjz4",
        public_key="5qwq9nrh6j52t8gv",
        private_key="f9d99fd4723cb471e2edb518639b0483"
    )
)

@app.route("/")
def index():

    # Generate client token for the dropin ui
    client_token = gateway.client_token.generate({})

    return render_template('index.html', token=client_token)

@app.route("/proc", methods=['GET', 'POST'])
def proc():

    result = gateway.transaction.sale({
        "amount": request.form['amount'],
        "payment_method_nonce": request.form["payment_method_nonce"],
        "options": {
            "submit_for_settlement": True
        }
    })

    return render_template('proc.html', result=result, request=request.form)


@app.route('/public/<path:path>')
def send_public(path):
    return send_from_directory('public', path)

if __name__ == "__main__":
    app.run()
