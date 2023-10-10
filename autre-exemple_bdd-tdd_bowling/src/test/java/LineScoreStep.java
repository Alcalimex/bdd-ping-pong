import io.cucumber.datatable.DataTable;
import io.cucumber.java.fr.Alors;
import io.cucumber.java.fr.Quand;
import io.cucumber.java.fr.Étantdonné;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

public class LineScoreStep {

    private List<String> frames;
    private int score;

    @Étantdonné("la ligne terminée")
    public void la_ligne_terminee(DataTable dataTable) {
        frames = dataTable.row(1);
    }

    @Quand("le score de la ligne est calculé")
    public void le_score_de_la_ligne_est_calcule() {
        score = LineScore.compute(frames);
    }

    @Alors("le score total est égal à {int}")
    public void le_score_total_est_egal_a(int expectedScore) {
        assertThat(score).isEqualTo(expectedScore);
    }

}
