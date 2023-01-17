// Declare a local variable .
int my_function() {
   int my_var = 0xbaba;
   return my_var;
}

/** Functions **/
void caller_function() {
   callee_function (0xdede);
}
int callee_function(int my_arg) {
   return my_arg ;
}


/** Variables **/
const int a = 3;
const int b = 4;
int total = a+b;

int main(){
   const int a = 3;
   const int b = 4;
   int total = a+b;
}

/** Pre Kernel **/
void my_function2 () {
   char* my_string = "Hello";
}

