import twstock as t
import pandas as p

stock = t.realtime.get('1215')
print(stock['success'])

result = p.DataFrame(stock).T.iloc[1:3]
# result.columns = ['']
print(result)