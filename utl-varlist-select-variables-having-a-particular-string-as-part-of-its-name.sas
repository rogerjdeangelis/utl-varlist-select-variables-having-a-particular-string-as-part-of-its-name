Problem                                                                                                                                     
   Select variables that contain a particular string as part of its name;                                                                   
                                                                                                                                            
   In this case variable names that contain '_3'                                                                                            
                                                                                                                                            
Another broken record                                                                                                                       
                                                                                                                                            
      Two Solutions                                                                                                                         
                                                                                                                                            
          a.   datastep                                                                                                                     
          b.   proc sql                                                                                                                     
                                                                                                                                            
                                                                                                                                            
This is very heavily tested macro, I have used it hundreds of tmes.                                                                         
varlist macro ( this a very flexible macro)                                                                                                 
Author: Søren Lassen, s.lassen@post.tele.dk                                                                                                 
                                                                                                                                            
github                                                                                                                                      
https://tinyurl.com/y5lgbd7g                                                                                                                
https://github.com/rogerjdeangelis/utl-varlist-select-variables-having-a-particular-string-as-part-of-its-name                              
                                                                                                                                            
SAS Forum                                                                                                                                   
https://tinyurl.com/y4snqr49                                                                                                                
https://communities.sas.com/t5/SAS-Programming/select-variables-having-a-particular-string-as-part-of-its-name/m-p/571634                   
                                                                                                                                            
macros                                                                                                                                      
https://tinyurl.com/y9nfugth                                                                                                                
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories                                                  
                                                                                                                                            
                                                                                                                                            
27 repos thta use varlist                                                                                                                   
https://tinyurl.com/y4nya7eu                                                                                                                
https://github.com/rogerjdeangelis?utf8=%E2%9C%93&tab=repositories&q=varlist+in%3Areadme&type=&language=                                    
                                                                                                                                            
*_                   _                                                                                                                      
(_)_ __  _ __  _   _| |_                                                                                                                    
| | '_ \| '_ \| | | | __|                                                                                                                   
| | | | | |_) | |_| | |_                                                                                                                    
|_|_| |_| .__/ \__,_|\__|                                                                                                                   
        |_|                                                                                                                                 
;                                                                                                                                           
                                                                                                                                            
Data have;                                                                                                                                  
   input ID x_1 X_2 X_3 Y_1 Y_2 W_3;                                                                                                        
cards4;                                                                                                                                     
1 2 3 4 5 6 7                                                                                                                               
2 3 4 5 6 7 8                                                                                                                               
;;;;                                                                                                                                        
run;quit;                                                                                                                                   
                                                                                                                                            
Up to 40 obs WORK.HAVE total obs=2                                                                                                          
                                                                                                                                            
Obs    ID    X_1    X_2    X_3    Y_1    Y_2    W_3                                                                                         
                                                                                                                                            
 1      1     2      3      4      5      6      7                                                                                          
 2      2     3      4      5      6      7      8                                                                                          
                                                                                                                                            
*            _               _                                                                                                              
  ___  _   _| |_ _ __  _   _| |_                                                                                                            
 / _ \| | | | __| '_ \| | | | __|                                                                                                           
| (_) | |_| | |_| |_) | |_| | |_                                                                                                            
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                                           
                |_|                                                                                                                         
;                                                                                                                                           
                                                                                                                                            
Up to 40 obs WORK.WANT total obs=2                                                                                                          
                                                                                                                                            
Obs    ID    X_3    W_3                                                                                                                     
                                                                                                                                            
 1      1     4      7                                                                                                                      
 2      2     5      8                                                                                                                      
                                                                                                                                            
                                                                                                                                            
*          _       _   _                                                                                                                    
 ___  ___ | |_   _| |_(_) ___  _ __  ___                                                                                                    
/ __|/ _ \| | | | | __| |/ _ \| '_ \/ __|                                                                                                   
\__ \ (_) | | |_| | |_| | (_) | | | \__ \                                                                                                   
|___/\___/|_|\__,_|\__|_|\___/|_| |_|___/                                                                                                   
                                                                                                                                            
;                                                                                                                                           
                                                                                                                                            
*               _       _            _                                                                                                      
  __ _       __| | __ _| |_ __ _ ___| |_ ___ _ __                                                                                           
 / _` |     / _` |/ _` | __/ _` / __| __/ _ \ '_ \                                                                                          
| (_| |_   | (_| | (_| | || (_| \__ \ ||  __/ |_) |                                                                                         
 \__,_(_)   \__,_|\__,_|\__\__,_|___/\__\___| .__/                                                                                          
                                            |_|                                                                                             
;                                                                                                                                           
data want;                                                                                                                                  
                                                                                                                                            
  set have(keep =id %varlist(have,prx=/_3/));                                                                                               
                                                                                                                                            
run;quit;                                                                                                                                   
                                                                                                                                            
*_                   _                                                                                                                      
| |__      ___  __ _| |                                                                                                                     
| '_ \    / __|/ _` | |                                                                                                                     
| |_) |   \__ \ (_| | |                                                                                                                     
|_.__(_)  |___/\__, |_|                                                                                                                     
                  |_|                                                                                                                       
;                                                                                                                                           
proc sql;                                                                                                                                   
   create                                                                                                                                   
      table want as                                                                                                                         
   select                                                                                                                                   
      id                                                                                                                                    
     ,%varlist(have,od=%str(,),prx=/_3/)                                                                                                    
   from                                                                                                                                     
     have                                                                                                                                   
;quit;                                                                                                                                      
                                                                                                                                            
                                                                                                                                            
                                                                                                                                            
