@contributor{Vadim Zaytsev - vadim@grammarware.net - SWAT, CWI}
@wiki{InlineMax}
module mutate::type1::InlineMax

import lib::Rascalware;
import syntax::BGF;
import syntax::XBGF;
import transform::library::Folding;

BGFGrammar InlineMax(BGFGrammar g)
{
	ns = definedNs(g.prods);
	bool done = False
	while(True)
	{
		if (isEmpty(ns))
			break;
		x,ns = takeOneFrom(ns);
		if (<ps1,[production(str l, x, BGFExpression rhs)],ps2> := splitPbyW(g.prods,innt(x)) && /nonterminal(x) !:= rhs)
		{
			g = transform::library::Folding::runInline(x,g);
			ns = definedNs(g);
		}
	}
	return g;
}