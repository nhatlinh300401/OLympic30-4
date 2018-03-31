const   inp='';
        out='';

var     f1,f2:text; n,m,s,t:longint;
        free:array[0..1001] of boolean;
        d:array[0..1001] of longint;
        c:array[0..10001,0..10001] of longint;

function min(a,b:longint):longint;
begin
        if a>b then min:=b else min:=a;
end;
procedure nhap;
var     i,x,y:longint;
begin
        //assign(f1,inp);reset(f1);
        //assign(f2,out);rewrite(f2);
        readln(n,m,s,t);
        for i:=1 to m do
                begin
                        readln(x,y,c[x,y]);
                        c[y,x]:=c[x,y];
                end;
        fillchar(free,sizeof(free),true);
        fillchar(d,sizeof(d), 0);
        d[s]:=high(longint);
end;

procedure dijktra;
var     i,v,h,u,max:longint;
begin
        repeat
                u:=0; max:=0;
                for i:=1 to n do
                        if free[i] and (max<d[i]) then
                                begin
                                        max:=d[i];
                                        u:=i;
                                end;
                if (u=0) or (u=t) then break;
                free[u]:=false;
                for v:=1 to n do
                        begin
                                h:=min(d[u],c[u,v]);
                                if free[v] and (d[v]<h) then d[v]:=h;
                        end;
        until false;
end;

begin
        nhap;
        dijktra;
        if d[t]=0 then writeln('-1')
        else write(d[t]);
        //close(f1); close(f2);
end.
