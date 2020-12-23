MODULE Module1
    
    CONST robtarget Target_10:=[[71.701545771,-426.979542572,263.976201098],[0.001935005,0.646597164,0.762825201,0.002465164],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST jointtarget jtHome :=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_20:=[[432.683377043,-249.942710833,159.209987095],[0.705538531,-0.063882196,0.704215212,-0.04706783],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_30:=[[228.331719638,431.561964685,15.8],[0,0.660220036,0.751072236,0],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    !***********************************************************
    !
    ! Module:  Module1
    !
    ! Description:
    !   <Insert description here>
    !
    ! Author: diazraphael
    !
    ! Version: 1.0
    !
    !***********************************************************
    
    
    !***********************************************************
    !
    ! Procedure main
    !
    !   This is the entry point of your program
    !
    !***********************************************************
    PROC main()
        Set DO_Open;
        Set DO_detacher;
        Set DO_Reset;
        
        
        WaitTime 0.1;
        
        Reset DO_Close;
        Reset DO_Open;
        Reset DO_Reset;
        Reset DO_Soude_Open;
        Reset DO_Soud;
        Reset DO_detacher;
        Set DO_detacher;
        
        WaitTime 0.1;
        
        MoveAbsJ jtHome\NoEOffs,v1000,z50,Gripper_micro\WObj:=wobj0;
        Manipulation;
        MoveAbsJ jtHome\NoEOffs,v1000,z50,Gripper_micro\WObj:=wobj0;
        Set DO_Reset;
        
    ENDPROC
	PROC Manipulation()
        
        MoveJ OFFS(Target_10,0,0,50),v1000,z5,Gripper_micro\WObj:=Workobject_1;
        MoveL Target_10,v1000,z100,Gripper_micro\WObj:=Workobject_1;
        
        WaitTime \InPos,0.1;
        SetDO DO_Close,1;
        WaitTime 0.3;
        
        MoveL Offs(Target_10,0,0,50),v1000,z5,Gripper_micro\WObj:=Workobject_1;
        MoveJ OFFS(Target_20,0,0,50),v1000,z5,Gripper_micro\WObj:=wobj0;
	    MoveL Target_20,v100,z1,Gripper_micro\WObj:=wobj0;
        
        WaitTime \InPos,3;
        SetDO DO_Soude_Open,1;
        SetDO DO_Soud,1;
        WaitTime 2;
        SetDO DO_Soude_Open,1;
        WaitTime 2;
        
        MoveAbsJ jtHome\NoEOffs,v1000,z50,Gripper_micro\WObj:=wobj0;
        
        MoveJ OFFS(Target_30,0,0,50),v600,z5,Gripper_micro\WObj:=wobj0;
	    MoveL Target_30,v100,z1,Gripper_micro\WObj:=wobj0;
    
        WaitTime 1.2;
        SetDO DO_Open,1;
        
        
    ENDPROC
ENDMODULE