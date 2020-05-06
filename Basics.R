###Basics
a=6
b=6
c=90
x=a+b
x

###classes
class(a)
v=TRUE
class(v)

###vectors
my_vector=c(1,2)
my_vector2=c("Hello","world")
my_vector3=c("hello",3,4,5)
class(my_vector3)
my_vector[4]

###matrices
my_matrix=matrix(my_vector,nrow=2,ncol=2)
my_matrix
1:9
my_matrix2=matrix(1:9,nrow=3,ncol=3)
my_matrix2
my_matrix2[1,]
my_matrix2[,3]
my_matrix[1:2,1:2]
my_matrix2[-2,-2]

#dataframes
my_dataframe=data.frame(my_vector,my_vector2)
my_dataframe
class(my_dataframe)
class(my_dataframe$my_vector)
class(my_dataframe$my_vector2)
my_dataframe[1,]
my_dataframe[,2]
my_dataframe[-2]

#lists
my_list=list(my_vector,my_matrix,my_dataframe)
my_list
my_list[[2]]
my_list[[2]][2,]

