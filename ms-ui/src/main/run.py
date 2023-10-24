from ui import app
import os 

if __name__ == "__main__":
    if lower(os.getenv('DEBUG')) == "true":
        app.run(debug = True, host='0.0.0.0')
    else: 
        app.run(debug = False, host='0.0.0.0')
