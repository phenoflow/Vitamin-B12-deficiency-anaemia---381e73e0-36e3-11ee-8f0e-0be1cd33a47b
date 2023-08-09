# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2023.

import sys, csv, re

codes = [{"code":"66E6.00","system":"readv2"},{"code":"66E7.00","system":"readv2"},{"code":"D010.11","system":"readv2"},{"code":"D011011","system":"readv2"},{"code":"D011013","system":"readv2"},{"code":"D011100","system":"readv2"},{"code":"D011200","system":"readv2"},{"code":"11126","system":"med"},{"code":"12329","system":"med"},{"code":"22715","system":"med"},{"code":"24581","system":"med"},{"code":"2464","system":"med"},{"code":"2482","system":"med"},{"code":"2515","system":"med"},{"code":"2813","system":"med"},{"code":"29486","system":"med"},{"code":"31126","system":"med"},{"code":"31270","system":"med"},{"code":"32953","system":"med"},{"code":"35092","system":"med"},{"code":"36840","system":"med"},{"code":"42928","system":"med"},{"code":"46289","system":"med"},{"code":"47952","system":"med"},{"code":"48714","system":"med"},{"code":"5271","system":"med"},{"code":"53846","system":"med"},{"code":"54738","system":"med"},{"code":"55370","system":"med"},{"code":"56973","system":"med"},{"code":"58599","system":"med"},{"code":"6028","system":"med"},{"code":"62637","system":"med"},{"code":"66935","system":"med"},{"code":"69275","system":"med"},{"code":"72895","system":"med"},{"code":"7403","system":"med"},{"code":"7736","system":"med"},{"code":"8013","system":"med"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('vitamin-b12-deficiency-anaemia-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["vitamin-b12-deficiency-anaemia---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["vitamin-b12-deficiency-anaemia---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["vitamin-b12-deficiency-anaemia---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
