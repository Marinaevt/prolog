live('zebra',earth).
live('dog',earth).
live('karp',water).
live('kit',water).
live('cat',X):-live('dog',X).
live('croc', X) :- X=water;X=earth.
live('frog',X) :- X=water;X=earth.
live('duck',X) :- X=water;X=earth;X=air.
live('orel',X) :- X=earth;X=air.
live('burev',X) :- X=water;X=air.

%live('croc',water).
%live('croc',earth).
%live('frog',water).
%live('frog',earth).
%live('duck',water).
%live('duck',air).
%live('duck',earth).
%live('orel',air).
%live('orel',earth).
%live('burev',water).
%live('burev',air).
