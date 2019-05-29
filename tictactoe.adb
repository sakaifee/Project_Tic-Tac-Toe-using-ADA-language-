With Gnat.IO; use Gnat.IO;       
procedure tictactoe is           

	signs:array(0..1) of Character:=('X','O');  
	
	type Ind is mod 3;
	i,j:Ind;

   	type brd is array(Ind,Ind) of Character ;    
	
	Board:brd:=(('_','_','_'),                   
					      ('_','_','_'),
					      ('_','_','_'));
	
	procedure BoardDisp(Board:brd) is		 
		n:Integer:=1;                       
	begin
		for i in Ind loop
			Put(n);Put("  |" );Put(n+1 );Put("  |");Put(n+2);  
			New_Line;	                                      
			
			Put(Board(i,0));Put(" | ");Put(Board(i,1));Put(" | ");Put(Board(i,2));      
			New_Line;
	
			Put("   |   |");
			New_Line;
			
			if i<2 then
				Put_Line("---+---+---");   
				n:=n+3;
			end if;
		end loop;
	end BoardDisp;

	function inputV(N:Integer) return Ind is   
	begin
		case N is                         
			when 1..3 => return 0;   
			when 4..6 => return 1;   
			when 7..9 => return 2;
			when others => return 0; 
		end case;
	end inputV;

	function inputH(N:Integer) return Ind is
	begin
		case N is
			when 1|4|7 => return 0;
			when 2|5|8 => return 1;
			when 3|6|9 => return 2;
			when others => return 0;
		end case;
	end inputH;	

	N:Integer;		       --Player Input            diff type float,int,char,bool , variable define
	Pnum:Integer:=1;	   --Active Player Number(initially 1),    : =   -> assignment operator 
	Tcount:Integer:=0;	   --Total Number of turns played
	Gstatus:Integer:=0;	   --Game status
begin               
	Put_Line("Player 1:- "& signs(0) & "Player 2:-" & signs(1));    
	New_Line;                                                                      
	
	Main:loop
		exit when Gstatus/=0;                           -- /=0 -> conditonal status not equals to 0 ,exit -> normal loop se exit karne 													
		Put("Player ");Put(Pnum);Put("s turn!");        --  to show the turn of players
		New_Line;
		
		BoardDisp(Board);                              
		New_Line;
		
		Put_Line("Enter your Choice:-");
		Get(N);                                          -- to take the input (block no)
		while N>9 loop                                   -- to check range of block no 
			Put_Line("Please enter a valid Block Number:-");
			Get(N);
		end loop;

		i:=inputV(N);     -- N se row index generate kar raha hn 
		j:=inputH(N);     -- N se col index generate kar raha hn 
		while Board(i,j)/='_' loop
			
			Put_Line("This block is occupied. Please choose an Empty Block:-");
			Get(N);
			while N>9 loop
				Put_Line("Please enter a valid Block Number:-");
				Get(N);
			end loop;
			
			i:=inputV(N);
			j:=inputH(N);
		end loop;

		Board(i,j):= signs(Pnum-1);
		
		
		if Board(i,j) = Board(i,j+1) and Board(i,j) = Board(i,j+2) then  -- checking if the blocks in the same row have same value
			BoardDisp(Board);	
			Put("Player ");Put(Pnum);Put(" Wins!!");
			New_Line;
			Gstatus:=1;

		elsif Board(i,j) = Board(i+1,j) and Board(i,j) = Board(i+2,j) then
			BoardDisp(Board);
			Put("Player ");Put(Pnum);Put(" Wins!!");
			New_Line;
			Gstatus:=1;

		elsif i=j and Board(i,j) = Board(i+1,j+1) and Board(i,j) = Board(i+2,j+2) then
			BoardDisp(Board);
			Put("Player ");Put(Pnum);Put(" Wins!!");
			New_Line;
			Gstatus:=1;

		elsif i+j=2 and Board(i,j) = Board(i+1,j+2) and Board(i,j) = Board(i+2,j+1) then
			BoardDisp(Board);
			Put("Player ");Put(Pnum);Put(" Wins!!");
			New_Line;
			Gstatus:=1;

		else
			Pnum:= 3-Pnum;
			Tcount:= Tcount+1;    --total no turns kitne play kiye players
			if Tcount = 9 then 
				Put_Line("Its A Tie");
				Gstatus:=2;
			end if;
		end if;			
	end loop Main;

	New_Line;
	Put_Line("Thanks For Playing");	
end tictactoe;	
