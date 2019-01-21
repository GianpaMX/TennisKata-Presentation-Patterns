package io.github.gianpamx.tenniskatapresentationpatterns.mvc

import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import io.github.gianpamx.tenniskatapresentationpatterns.R
import kotlinx.android.synthetic.main.activity_main.*

/**
 * This is the controller
 */
class MainActivity : AppCompatActivity() {
    lateinit var model: Model

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        model = if (savedInstanceState == null) {
            Model(this)
        } else {
            Model(
                    this,
                    savedInstanceState.get("player1") as Model.Score,
                    savedInstanceState.get("player2") as Model.Score
            )
        }
    }

    override fun onSaveInstanceState(outState: Bundle?) {
        super.onSaveInstanceState(outState)
        outState?.putSerializable("player1", model.player1score)
        outState?.putSerializable("player2", model.player2score)
    }

    fun player1ButtonOnClickListener(view: View) {
        model.player1()
    }

    fun player2ButtonOnClickListener(view: View) {
        model.player2()
    }

    fun notifyChanges() {
        updateView(model.player1score, model.player2score)
    }

    fun updateView(player1score: Model.Score, player2score: Model.Score) {
        player1TextView.text = player1score.name
        player2TextView.text = player2score.name
    }
}
