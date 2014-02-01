function B = bernstein(n, t)
    % Diese Version verwendet die in der Vorlesung gezeigten optimierungen,
    % soweit ich sie implementieren konnte. Hinweis: zuerst habe ich
    % slow_bernstein.m implementiert um überhaupt wirklich zu verstehen,
    % was passiert. In der Datei finden sich auch ausführlichere
    % Beschreibungen, was ich gemacht habe.
    %
    % Nachdem ich mir die Lösung angesehen habe, habe ich die Matrix
    % transponiert, also den Code entsprechend angepasst. Dadurch sollte es
    % einfacher sein die folgenden Aufgaben auszuprogrammieren und dann mit
    % der ML zu vergleichen.
    l = length(t);
    B = [ones(1, l); zeros(n, l)];
    
    % Nachfolgender Code basiert auf den Vorlesungsfolien (#10, S. 7/8)
    % und der Musterlösung teilweise, da ich die Idee nicht gesehen habe,
    % wie man es wirklich schneller macht.
    for i = 1:n % iteration über Spalten
        for j = (i+1):-1:2
            B(j, :) = t .* B(j-1, :) + (1 - t) .* B(j, :); % rot markierte Gleichung auf Folie
        end
        
        B(1, :) = (1 - t) .* B(1, :); % 1. Gleichung auf Seite 8.
    end
end

