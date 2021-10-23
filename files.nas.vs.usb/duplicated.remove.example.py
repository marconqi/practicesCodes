import pandas as pd

aFiles = pd.read_csv("a.csv",delimiter=',',header=None,names=["1","2","3"])
bFiles = pd.read_csv("b.csv",delimiter=',',header=None,names=["1","2","3"])
file_merge = pd.merge(aFiles, bFiles, on=["1","2","3"], how='inner')
aFiles = aFiles.append(file_merge)
aFiles['Duplicated'] = aFiles.duplicated(keep=False)
print(aFiles)
df_final = aFiles[~aFiles['Duplicated']]
#del df_final['Duplicated']
print(df_final)