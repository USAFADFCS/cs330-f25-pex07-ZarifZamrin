% pex5.pl
% USAFA UFO Sightings 2024
%
% name: Zarif Bin Mohd Zamrin
%
% Documentation: Referred to HW07 for all_different helper functions as well as the structure of the code. Including tell helper function. I essnetially just copied the entire HW07 but changed the variable names and adjusted the cosntraints.
%                No other resources were used.

%

% The query to get the answer(s) or that there is no answer


cadet(smith).
cadet(garcia).
cadet(jones).
cadet(chen).

day(tue).
day(wed).
day(thu).
day(fri).

object(weather_balloon).
object(kite).
object(fighter_aircraft).
object(cloud).

solve :-
    day(Tue), day(Wed), day(Thu), day(Fri),
    all_different([Tue, Wed, Thu, Fri]),

    cadet(Tue_Cadet), cadet(Wed_Cadet), cadet(Thu_Cadet), cadet(Fri_Cadet),
    all_different([Tue_Cadet, Wed_Cadet, Thu_Cadet, Fri_Cadet]),

    object(Tue_Object), object(Wed_Object), object(Thu_Object), object(Fri_Object),
    all_different([Tue_Object, Wed_Object, Thu_Object, Fri_Object]),

    Triples = [[tue, Tue_Cadet, Tue_Object],[wed, Wed_Cadet, Wed_Object],[thu, Thu_Cadet, Thu_Object],[fri, Fri_Cadet, Fri_Object]],

    \+ member([_, smith,weather_balloon], Triples),
    \+ member([_, smith,kite], Triples),

    \+ member([_,garcia,kite], Triples),

    (   member([fri,chen,_] , Triples); 
        member([fri,_,fighter_aircraft] , Triples)
    ),

    \+ member([tue,_,kite] , Triples),

    \+ member([_,garcia,weather_balloon] , Triples),
    \+ member([_,jones,weather_balloon] , Triples),

    \+ member([tue,jones,_] , Triples),

    member([_,smith,cloud], Triples),

    member([fri,_,fighter_aircraft], Triples),

    \+ member([wed,_,weather_balloon], Triples),

    tell(tue,Tue_Cadet,Tue_Object),
    tell(wed,Wed_Cadet,Wed_Object),
    tell(thu,Thu_Cadet,Thu_Object),
    tell(fri,Fri_Cadet,Fri_Object).


all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).

tell(Day, Cadet, Object) :-
    write(Day), write(': '), write(Cadet) , write(' saw the '),  write(Object), write('.'), nl.