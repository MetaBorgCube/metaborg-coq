Module M.
  Definition T := nat.
  Definition x := 0.
  Definition y : bool.
    exact true.
  Defined.
End M.

Module Type SIG.
  Parameter T : Set.
  Parameter x : T.
End SIG.

Module N  :  SIG with Definition T := nat  :=  M.

Module Type SIG'.
  Definition T : Set := nat.
  Parameter x : T.
End SIG'.

Module N' : SIG' := M.

Module P <: SIG := M.

Module Two (X Y: SIG).
  Definition T := (X.T * Y.T)%type.
  Definition x := (X.x, Y.x).
End Two.

Module Q := Two M N.

Module Type SIG2.
  Declare Module M1 : SIG.
  Module M2 <: SIG.
    Definition T := M1.T.
    Parameter x : T.
  End M2.
End SIG2.

Module Mod <: SIG2.
  Module M1.
    Definition T := nat.
    Definition x := 1.
  End M1.
  Module M2 := M.
End Mod.

Module N'' : SIG := M. 
Module N''' : SIG.
  Definition T := nat.
  Definition x := 0.
End N'''. 

Module Mod'.
  Definition T := nat.
End Mod'.

Import Mod'.

