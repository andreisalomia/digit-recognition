function prediction = KNN (labels, Y, test, k)
  % initializeaza prediction
  prediction = -1;
  
  % initializeaza distantele
  [m, n] = size (Y);
  distance = zeros (m, 1);
  
  # Calculul normei dintre fiecare rand al matricei si vectorul test
  for i=1:m
    row_Y=Y(i,:);
    distance(i)=norm(row_Y-test);
  endfor  
  
  # sortarea crescatoare a distantelor
  [~, aux]=sort(distance);
  vector=labels(aux(1:k));
  
  prediction=median(vector);
endfunction
