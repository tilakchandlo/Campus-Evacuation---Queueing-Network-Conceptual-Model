# Cartoon map of the Georgia Tech campus #

This data was originally collected and produced by Jack Chua and Dedrick Duckett, two Georgia Tech alums.

The main file of interest is `world1.csv`, which is a comma-separated values file of the form,

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Type,X1,Y1,X2,Y2,Capacity,Comment
Street,27,32,77,32,2,10th St.
Street,77,32,127,32,2,10th St.
Street,127,32,168,30,2,10th St.
...
Parking,712,342,682,342,150,Theta Xi parking
Parking,681,131,615,131,250,
...
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

There are two types of data elements in this file: streets and parking
lots.

* Streets are given as undirected edges whose coordinate endpoints are
  (X1, Y1) and (X2, Y2). All streets are assumed to be bidirectional,
  though some streets (e.g., 10th Street on the north side of campus)
  are marked as double-capacity streets.

* Parking lots are given as an endpoint (X1, Y1), as well as an
  additional endpoint at the intersection into which that parking lot
  feeds (X2, Y2). The capacity field is an estimated number of cars
  (but is probably made up, rather than being derived from a real
  measurement).

If it was available, a short comment is assigned to many of the data
items, which can aid in debugging.

**Scaling:** According to Jack's and Dedrick's notes, the scale is
supposed to be 70 logical units for every 500 feet.

See `gt-world.pdf` for a visualization of this world. The R script,
`viz-world.R`, will regenerate it. (More importantly, that script may
be helpful in figuring out how to interpret the information in the CSV
file.)
