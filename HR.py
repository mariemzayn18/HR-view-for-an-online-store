import json
from flask import Flask , jsonify ,request
from flask_mysqldb import MySQL
from flask_restful import Resource, Api, reqparse

app = Flask(__name__)


app.config["DEBUG"] = True

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '123456789'
app.config['MYSQL_DB'] = 'onlinestore'

mysql = MySQL(app)
parser = reqparse.RequestParser()

################################ Get DM details for HR ###################################

@app.route('/deliveryMenHR', methods=['GET'])
def AllDeliveryMen_View():
    cursor= mysql.connection.cursor()
    cursor.execute(" Select * from DeliveryMan")
    DeliveryMen= cursor.fetchall()
    field_names = [i[0] for i in cursor.description]
    objects_list = []
    for row in DeliveryMen:
        d = {}
        for i in range (len(field_names)):
            d[field_names[i]] = row[i]
        
        objects_list.append(d)
    json_string = json.dumps(objects_list)
    mysql.connection.commit()
    cursor.close()
    return json_string


################################ Add bonus to a DM #######################################
@app.route('/deliveryMenBonus', methods=['POST'])
def Bonus_to_DM():
    parser.add_argument("Bonus")
    parser.add_argument("Id")
    args = parser.parse_args()
    cursor = mysql.connection.cursor()
    cursor.execute(" UPDATE DeliveryMan SET Bonus= {} where ID = {}; ".format(args["Bonus"],args["Id"]))
    mysql.connection.commit()
    cursor.close()
    return "1"    


################################ Get SM details for HR ###################################

@app.route('/SalesMenHR', methods=['GET'])
def AllSalesMen_View():
    cursor= mysql.connection.cursor()
    cursor.execute(" Select * from SalesMan")
    SalesMen= cursor.fetchall()
    field_names = [i[0] for i in cursor.description]
    objects_list = []
    for row in SalesMen:
        d = {}
        for i in range (len(field_names)):
            d[field_names[i]] = row[i]
        
        objects_list.append(d)
    json_string = json.dumps(objects_list)
    mysql.connection.commit()
    cursor.close()
    return json_string


################################ Get Customer details for HR ###################################

@app.route('/CustomerHR', methods=['POST'])
def Customer_HRView():
    parser.add_argument("Id")
    args = parser.parse_args()
    cursor= mysql.connection.cursor()
    cursor.execute(" Select * from Customer WHERE Id= {}; ".format(args["Id"]))
    customer= cursor.fetchall()
    field_names = [i[0] for i in cursor.description]
    objects_list = []
    for row in customer:
        d = {}
        for i in range (len(field_names)):
            d[field_names[i]] = row[i]
        
        objects_list.append(d)
    json_string = json.dumps(objects_list)
    mysql.connection.commit()
    cursor.close()
    return json_string


################################ Get Complaints details for HR ###################################

@app.route('/ComplaintsHR', methods=['GET'])
def Complaints_HRView():
    cursor= mysql.connection.cursor()
    cursor.execute(" Select DISTINCT * from Complaint")
    customer= cursor.fetchall()
    field_names = [i[0] for i in cursor.description]
    objects_list = []
    for row in customer:
        d = {}
        for i in range (len(field_names)):
            d[field_names[i]] = row[i]
        
        objects_list.append(d)
    json_string = json.dumps(objects_list)
    mysql.connection.commit()
    cursor.close()
    return json_string

################################ Respond to Complaints details for HR ###################################

@app.route('/Respond_complaint', methods=['POST'])
def RespondToComplaint():
    parser.add_argument("respond")
    parser.add_argument("customerid")
    args = parser.parse_args()
    cursor= mysql.connection.cursor()
    cursor.execute(" Update complaint set respond ='{}' where customerid= {}; ".format(args["respond"],args["customerid"]))
    mysql.connection.commit()
    cursor.close()
    return '1'

################################ Resolved Complaints details ###################################

@app.route('/resolvedshow', methods=['GET'])
def ResolvedComplaintsShow():
    cursor= mysql.connection.cursor()
    cursor.execute(" Select * from Complaint where respond is not null ;")
    customer= cursor.fetchall()
    field_names = [i[0] for i in cursor.description]
    objects_list = []
    for row in customer:
        d = {}
        for i in range (len(field_names)):
            d[field_names[i]] = row[i]
        
        objects_list.append(d)
    json_string = json.dumps(objects_list)
    mysql.connection.commit()
    cursor.close()
    return json_string

############################### Search for delivery men with rating########################################

@app.route('/DeliveryMenRateHR', methods=['POST'])
def DeliveryMenRateHR():
    parser.add_argument("rate")

    args = parser.parse_args()
    cursor= mysql.connection.cursor()
    cursor.execute("Select * from DeliveryMan WHERE Id in ( select DeliveryManId from Feedbackdelivery where Rate= {} ); ".format(args["rate"]))
    dm= cursor.fetchall()
    field_names = [i[0] for i in cursor.description]
    objects_list = []
    for row in dm:
        d = {}
        for i in range (len(field_names)):
            d[field_names[i]] = row[i]
        
        objects_list.append(d)
    json_string = json.dumps(objects_list)
    mysql.connection.commit()
    cursor.close()
    return json_string

############################### Get rating of each deliveryman########################################

@app.route('/RateDM_HR', methods=['POST'])
def rate_HRView():
    parser.add_argument("ID")
    args = parser.parse_args()
    cursor= mysql.connection.cursor()
    cursor.execute(" Select AVG(rate) from feedbackdelivery, deliveryman where feedbackdelivery.DeliveryManId = deliveryman.id and deliverymanid={} ".format(args["ID"]))
    rate= cursor.fetchall()
    mysql.connection.commit()
    cursor.close()
    return rate

############################### Get feedback  of each deliveryman HR########################################
@app.route('/FeedbackDMHR', methods=['GET'])
def FeedbackDMHR():
    cursor= mysql.connection.cursor()
    cursor.execute(" Select * from feedbackdelivery")
    dm= cursor.fetchall()
    field_names = [i[0] for i in cursor.description]
    objects_list = []
    for row in dm:
        d = {}
        for i in range (len(field_names)):
            d[field_names[i]] = row[i]
        
        objects_list.append(d)
    json_string = json.dumps(objects_list)
    mysql.connection.commit()
    cursor.close()
    return json_string

################################ Get delivery men details for HR for feedback###################################

@app.route('/DM_Feedback_details', methods=['POST'])
def DM_Feedback_details():
    parser.add_argument("Id")
    args = parser.parse_args()
    cursor= mysql.connection.cursor()
    cursor.execute(" Select * from deliveryman WHERE Id= {}; ".format(args["Id"]))
    customer= cursor.fetchall()
    field_names = [i[0] for i in cursor.description]
    objects_list = []
    for row in customer:
        d = {}
        for i in range (len(field_names)):
            d[field_names[i]] = row[i]
        
        objects_list.append(d)
    json_string = json.dumps(objects_list)
    mysql.connection.commit()
    cursor.close()
    return json_string


################################### Respond to complaints (Customer view) ################################
@app.route('/resolvedshowCustomer', methods=['POST'])
def ResolvedComplaintsShow_customer():
    parser.add_argument("Id")
    args = parser.parse_args()
    cursor= mysql.connection.cursor()
    cursor.execute(" Select * from Complaint where respond is not null and customerid={} ;".format(args["Id"]))
    customer= cursor.fetchall()
    field_names = [i[0] for i in cursor.description]
    objects_list = []
    for row in customer:
        d = {}
        for i in range (len(field_names)):
            d[field_names[i]] = row[i]
        
        objects_list.append(d)
    json_string = json.dumps(objects_list)
    mysql.connection.commit()
    cursor.close()
    return json_string



app.run(host='localhost', port=5000)