# Spark

This is an implementation of the Spark API for Lean 4.

## Motivation

It's somewhat expensive to maintain consistent Spark queries because one relies
on running the Spark validator to catch inconsistencies in the pipeline. Some
examples of such inconsistencies are:

* Dataframes with duplicated column names
* Inexistent selected columns
* Joins performed on absent columns
* Joins that result on dataframes with duplicated columns

We want to use Lean 4's powerful type system to prevent those at compilation
time rather than relying on running the Spark validator everytime in some
integration test.

## Plan of action

We will provide an interface to create verified Spark queries and an executable
binary that can run them, communicating with the Spark kernel via FFI.
