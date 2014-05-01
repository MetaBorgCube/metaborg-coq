Require Import Program.
Require Import Lists.List.

Inductive sorts : Set :=
| INT_S
| ID_S
.

Parameter Ident : Set.

Definition sort : Set := sorts.

Inductive Constructors : Set := INTC (n: nat).

Definition constructors : Set := Constructors.

Fixpoint get_sig (x:constructors) : (list sort) * sort :=
  match x with
    | INTC n => ([], INT_S)
  end.

Record point := rec {x : nat ; y : nat}.