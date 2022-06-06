def hello := "world"

inductive Column
  | integer : String → Column
  | float   : String → Column
  | string  : String → Column
  | boolean : String → Column
  deriving BEq

@[simp] def Column.name : Column → String
  | integer n => n
  | float   n => n
  | string  n => n
  | boolean n => n

abbrev Scheme := List Column

@[simp] def List.noDup [BEq α] : List α → Bool
  | []      => true
  | a :: as => ¬as.contains a && as.noDup

@[simp] def List.isSubOf [BEq α] : List α → List α → Bool
  | [],      _  => true
  | a :: as, of => of.contains a && as.isSubOf of

@[simp] def Scheme.columnsNames (scheme : Scheme) : List String :=
  scheme.map fun c => c.name

@[simp] def Scheme.noDup (scheme : Scheme) : Bool :=
  scheme.columnsNames.noDup

structure DataFrame where
  scheme : Scheme
  noDup  : scheme.noDup

def DataFrame.new (scheme : Scheme) (h : scheme.noDup := by simp) : DataFrame :=
  ⟨scheme, h⟩

def ex : DataFrame := .new [.integer "aa", .float "bb"] -- works

def DataFrame.select (df : DataFrame) (cols : List String)
    (h : cols.noDup) (h' : cols.isSubOf df.scheme.columnsNames) : DataFrame :=
  sorry
