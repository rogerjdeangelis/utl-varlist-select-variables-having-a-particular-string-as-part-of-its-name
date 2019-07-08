# utl-varlist-select-variables-having-a-particular-string-as-part-of-its-name
    Select variables that contain a particular string as part of its name;                                                        
                                                                                                                                  
    In this case variable names that contain '_3'                                                                                 
                                                                                                                                  
          Two Solutions                                                                                                           
                                                                                                                                  
              a.   datastep                                                                                                       
              b.   proc sql                                                                                                       
              c.   HASH (this is a novel approach with potential)                                                                 
                                                                                                                                  
                   Paul Dorfman                                                                                                   
                   sashole@bellsouth.net                                                                                          
                                                                                                                                  
                   Bartosz Jablonski                                                                                              
                   yabwon@gmail.com                                                                                               
                                                                                                                                  
                                                                                                                                  
    This is very heavily tested macro. I have used it hundreds of tmes.                                                           
    varlist macro ( this a very flexible macro)                                                                                   
    Author: Søren Lassen, s.lassen@post.tele.dk                                                                                   
                                                                                                                                  
    github                                                                                                                        
    https://tinyurl.com/y5lgbd7g                                                                                                  
    https://github.com/rogerjdeangelis/utl-varlist-select-variables-having-a-particular-string-as-part-of-its-name                
                                                                                                                                  
    SAS Forum                                                                                                                     
    https://tinyurl.com/y4snqr49                                                                                                  
    https://communities.sas.com/t5/SAS-Programming/select-variables-having-a-particular-string-as-part-of-its-name/m-p/571634     
                                                                                                                                  
    SAS-L                                                                                                                         
    https://listserv.uga.edu/cgi-bin/wa?A2=SAS-L;9fdfc3b7.1907a                                                                   
                                                                                                                                  
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
                                                                                                                                  
                                                                                                                                  
    *          ____             _   ____             _                                                                            
      ___     |  _ \ __ _ _   _| | | __ )  __ _ _ __| |_                                                                          
     / __|    | |_) / _` | | | | | |  _ \ / _` | '__| __|                                                                         
    | (__ _   |  __/ (_| | |_| | | | |_) | (_| | |  | |_                                                                          
     \___(_)  |_|   \__,_|\__,_|_| |____/ \__,_|_|   \__|                                                                         
                                                                                                                                  
    ;                                                                                                                             
                                                                                                                                  
    Using the dynamic properties of the hash object, it can be done in a single step.                                             
    I've added character variables to the sample data for the sake of generality.                                                 
    Note that _N_ is initially added to both the key and data portions for a reason.                                              
                                                                                                                                  
    data have ;                                                                                                                   
      input ID :$3. X_1 X_2 X_3 Y_1 Y_2 W_3 :$1. ;                                                                                
      cards ;                                                                                                                     
    ID1 1 2 3 4 5 6 C                                                                                                             
    ID2 2 3 4 5 6 7 D                                                                                                             
    run ;                                                                                                                         
                                                                                                                                  
    data _null_ ;                                                                                                                 
      if _n_ = 1 then do ;                                                                                                        
        dcl hash h (ordered:"A") ;                                                                                                
        h.definekey  ("_n_") ;                                                                                                    
        h.definedata ("_n_") ;                                                                                                    
        if 0 then set have ;                                                                                                      
        Retain fake_char " " fake_num .;                                                                                          
        drop fake_:;                                                                                                              
        array nn _numeric_ ;                                                                                                      
        array cc _char_ ;                                                                                                         
        do over nn ;                                                                                                              
          if find (vname (nn), "3") then h.definedata (vname (nn)) ;                                                              
        end ;                                                                                                                     
        do over cc ;                                                                                                              
          if find (vname (cc), "3") then h.definedata (vname (cc)) ;                                                              
        end ;                                                                                                                     
        h.definedone() ;                                                                                                          
      end ;                                                                                                                       
      set have end = z ;                                                                                                          
      h.add() ;                                                                                                                   
      if z then h.output (dataset:"want (drop = _:)") ;                                                                           
    run ;                                                                                                                         
                                                                                                                                  
    Best regards                                                                                                                  
                                                                                                                                  
                                                                                                                                  
    Bartosz Jablonski via listserv.u                                                                                              
                                                                                                                                  
                                                                                                                                  
                                                                                                                     
                                                                                                                                       
